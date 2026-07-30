-- 1. What is the overall average property price by district and okrug?
SELECT district, okrug,
ROUND(AVG(price_rub),2) AS avg_property_price
FROM secondary_market GROUP BY district, okrug
ORDER BY avg_property_price DESC;

--2. What is the average monthly rent by district and furnishing status?
SELECT district,furnished,
ROUND(AVG(monthly_rent_rub),2) AS avg_monthly_rent
FROM rentals GROUP BY district, furnished
ORDER BY avg_monthly_rent DESC;

-- 3. How many total listings exist across districts and property categories?
SELECT district,SUM(n_listings_secondary) AS total_secondary_listings,
SUM(n_listings_newbuild) AS total_newbuild_listings, SUM(n_listings_rental) AS total_rental_listings
FROM district_prices_monthly GROUP BY district
ORDER BY total_secondary_listings DESC;

-- 4. Which TOP 5 districts have the highest resale prices by building type?
SELECT district,building_type,
ROUND(AVG(price_per_sqm),2) AS avg_price_per_sqm
FROM secondary_market GROUP BY district, building_type
ORDER BY avg_price_per_sqm DESC LIMIT 5;

-- 5. How does rental price vary with metro distance?
SELECT district,furnished,
    ROUND(AVG(metro_distance_min),2) AS average_metro_distance,
    ROUND(AVG(monthly_rent_rub),2) AS avg_rent
FROM rentals GROUP BY district, furnished
ORDER BY average_metro_distance;

-- 6. Which renovation types command the highest property prices?
SELECT building_type,renovation,rooms,
ROUND(AVG(price_rub),2) AS avg_property_price
FROM secondary_market GROUP BY building_type, renovation, rooms
ORDER BY avg_property_price DESC;

-- 7. What are the monthly trends of resale prices, rental prices, and mortgage rates?
SELECT year_month,district,okrug,secondary_price_per_sqm,rental_price_per_sqm_monthly,
avg_mortgage_rate_pct FROM district_prices_monthly
ORDER BY year_month;

-- 8. Which seller types dominate different districts?
SELECT district,building_type,renovation,seller_type,COUNT(id) AS total_properties 
FROM secondary_market GROUP BY district, building_type, renovation, seller_type
ORDER BY total_properties DESC;

-- 9. How does distance from city center affect property prices?
SELECT district,building_type,rooms,to_center_km,
ROUND(AVG(price_per_sqm),2) AS avg_price_per_sqm
FROM secondary_market GROUP BY district, building_type, rooms, to_center_km
ORDER BY to_center_km;

-- 10. Which districts have the highest rental and resale listing activity over time?
SELECT year_month,district,okrug,n_listings_secondary,n_listings_rental
FROM district_prices_monthly ORDER BY year_month;

-- 11. Which districts have higher-than-average resale prices and rental prices simultaneously?
WITH resale_avg AS (
    SELECT district,AVG(price_per_sqm) AS avg_resale_price FROM secondary_market GROUP BY district
),
rental_avg AS (
    SELECT district,AVG(rent_per_sqm) AS avg_rent_price FROM rentals GROUP BY district
)
SELECT r.district,r.avg_resale_price,rt.avg_rent_price
FROM resale_avg r JOIN rental_avg rt ON r.district = rt.district
WHERE r.avg_resale_price >(SELECT AVG(price_per_sqm) FROM secondary_market)
AND rt.avg_rent_price >(SELECT AVG(rent_per_sqm) FROM rentals)
ORDER BY r.avg_resale_price DESC;

-- 12. Find districts where rental growth is high but listing activity is low.
WITH rental_growth AS (
    SELECT district,AVG(rental_price_per_sqm_monthly) AS avg_rent
    FROM district_prices_monthly GROUP BY district
),
listing_activity AS (
    SELECT district,AVG(n_listings_rental) AS avg_rental_listings
    FROM district_prices_monthly GROUP BY district
)
SELECT
    rg.district,rg.avg_rent,la.avg_rental_listings
FROM rental_growth rg JOIN listing_activity la ON rg.district = la.district
WHERE la.avg_rental_listings <(SELECT AVG(n_listings_rental) FROM district_prices_monthly)
ORDER BY rg.avg_rent DESC;

-- 13. Which seller types list properties farthest from the city center?
WITH seller_distance AS (
    SELECT seller_type,district,AVG(to_center_km) AS avg_distance
    FROM secondary_market GROUP BY seller_type, district
)
SELECT seller_type,district,avg_distance,
RANK() OVER(PARTITION BY seller_type ORDER BY avg_distance DESC) AS distance_rank
FROM seller_distance;

-- 14. Compare average resale price and rental price district-wise.
WITH resale_data AS (
    SELECT district,AVG(price_per_sqm) AS avg_resale_price
 FROM secondary_market GROUP BY district
),
rental_data AS (
    SELECT district,AVG(rent_per_sqm) AS avg_rent_price FROM rentals GROUP BY district
)
SELECT r.district,r.avg_resale_price,rt.avg_rent_price FROM resale_data r 
INNER JOIN rental_data rt ON r.district = rt.district ORDER BY r.avg_resale_price DESC;

-- 15. Find districts where mortgage rates are above average but resale demand is still high.
WITH mortgage_data AS (
    SELECT district,AVG(avg_mortgage_rate_pct) AS avg_mortgage_rate
    FROM district_prices_monthly GROUP BY district
),resale_demand AS (
    SELECT district,AVG(n_listings_secondary) AS avg_secondary_listings
    FROM district_prices_monthly GROUP BY district
)SELECT m.district,m.avg_mortgage_rate,r.avg_secondary_listings FROM mortgage_data m 
JOIN resale_demand r ON m.district = r.district
WHERE m.avg_mortgage_rate > (SELECT AVG(avg_mortgage_rate_pct)FROM district_prices_monthly) ORDER BY r.avg_secondary_listings DESC;

-- 16. Identify top 5 most expensive building types in each district.
WITH building_prices AS (
    SELECT district,building_type,AVG(price_per_sqm) AS avg_price
    FROM secondary_market GROUP BY district, building_type
)
SELECT district,building_type,avg_price,
    DENSE_RANK() OVER(PARTITION BY district ORDER BY avg_price DESC) AS price_rank
FROM building_prices QUALIFY price_rank <= 5;

-- 17.Which districts have the best rental yield?
WITH resale_prices AS (
    SELECT district,
    AVG(price_rub) AS avg_property_price
    FROM secondary_market GROUP BY district
),
rental_prices AS (
    SELECT district,
    AVG(monthly_rent_rub) AS avg_monthly_rent
    FROM rentals GROUP BY district)
SELECT r.district,r.avg_property_price,rt.avg_monthly_rent,
ROUND(((rt.avg_monthly_rent * 12)/ r.avg_property_price) * 100,2) AS rental_yield_pct
FROM resale_prices r JOIN rental_prices rt ON r.district = rt.district
ORDER BY rental_yield_pct DESC;







