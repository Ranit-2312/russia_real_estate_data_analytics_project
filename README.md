# 🏡 Russia Real Estate Data Analytics Project

An end-to-end **Data Analytics Project** that explores the Russian real estate market using **Python, SQL, MySQL, Power BI, and AWS S3**. The project performs data cleaning, exploratory data analysis (EDA), statistical analysis, SQL-based business queries, and interactive dashboard development to uncover market trends, pricing patterns, rental insights, and property characteristics.

---

## 📌 Project Overview

The objective of this project is to analyze real estate data from Russia to understand pricing behavior, rental market trends, listing activity, and property characteristics across districts.

The project follows a complete analytics workflow:

- Data Collection
- Data Cleaning & Preprocessing
- Exploratory Data Analysis (EDA)
- Statistical Analysis
- Business Problem Solving
- SQL Analysis
- Interactive Power BI Dashboard
- Cloud Deployment using AWS S3

---

## 📂 Repository Structure

```
.
├── QUERY RESULTS/
│   ├── answer of query 1.csv
│   ├── answer of query 2.csv
│   └── ...
│
├── district_prices_monthly.csv
├── rentals.csv
├── secondary_market.csv
│
├── Untitled.sql
├── PROJECT DASHBOARD.pbix
├── project report.docx
│
├── .github/
│   └── workflows/
│       └── s3-deploy.yml
│
└── README.md
```

---

# 📊 Dataset Description

The project utilizes three datasets.

### 1. District Prices Monthly

Contains district-level monthly statistics including

- District
- Okrug
- Resale Price per sqm
- New Build Price per sqm
- Rental Price per sqm
- Mortgage Rate
- Listing Counts

---

### 2. Rentals

Contains rental property information including

- Property Area
- Rooms
- Floor
- Building Year
- Furnishing Status
- Pet Policy
- Metro Distance
- Distance from City Center
- Monthly Rent
- Rent per sqm

---

### 3. Secondary Market

Contains resale property information including

- Property Area
- Living Area
- Kitchen Area
- Rooms
- Floor
- Building Year
- Ceiling Height
- Balcony
- Metro Distance
- City Center Distance
- Property Price
- Price per sqm
- Mortgage Rate

---

# 🧹 Data Preprocessing

The datasets were cleaned before analysis.

Performed preprocessing includes:

- Missing value detection
- Duplicate record detection
- Removal of irrelevant columns
- Data type verification
- Statistical summary generation

After preprocessing, all datasets were clean and ready for analysis.

---

# 📈 Exploratory Data Analysis (EDA)

EDA was performed using:

- Descriptive Statistics
- Distribution Analysis
- Histogram
- Boxplot
- Correlation Matrix
- Covariance Matrix
- Scatter Plot
- Regression Plot
- Pair Plot
- Time Series Analysis
- District-wise Analysis

---

# 📊 Statistical Analysis

The following statistical techniques were used:

- Mean
- Median
- Standard Deviation
- Variance
- Covariance
- Correlation Analysis

These analyses help understand relationships between pricing, rental trends, listing activity, and property characteristics.

---

# ❓ Business Questions Solved

A total of **17 business questions** were answered using Python, SQL, and Power BI.

Some examples include:

1. Overall average property price by district and okrug.
2. Average monthly rent by district.
3. Total listings across districts.
4. Top 5 districts with highest resale prices.
5. Rental price variation with metro distance.
6. Renovation types with highest prices.
7. Monthly price trends.
8. Seller distribution across districts.
9. Effect of city center distance on prices.
10. District-wise listing activity.
11. Districts with simultaneously high resale and rental prices.
12. High rental growth but low listing activity.
13. Seller types listing properties farthest from city center.
14. District-wise resale and rental comparison.
15. Mortgage rate vs resale demand.
16. Most expensive building types.
17. Districts with the best rental yield.

---

# 🗄 SQL Analysis

The cleaned datasets were imported into **MySQL**.

SQL queries were written to answer all business questions and generate analytical reports.

---

# 📊 Power BI Dashboard

Interactive dashboard includes:

- Property Price Analysis
- Rental Market Overview
- Listing Activity
- District Comparison
- Time Series Trends
- Mortgage Rate Analysis
- KPI Cards
- Interactive Filters

---

# 🛠 Technologies Used

| Category | Tools |
|----------|-------|
| Programming | Python |
| Data Analysis | Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| Database | MySQL |
| Dashboard | Power BI |
| Version Control | Git & GitHub |
| Notebook | Jupyter Notebook |

---

# 📚 Python Libraries

```python
pandas
numpy
matplotlib
seaborn
mysql-connector-python
```

---

# 📌 Project Workflow

```
Data Collection
      ↓
Data Cleaning
      ↓
Exploratory Data Analysis
      ↓
Statistical Analysis
      ↓
Business Questions
      ↓
MySQL Analysis
      ↓
Power BI Dashboard
```

---

# 📷 Dashboard Preview

Add screenshots of your Power BI dashboard here.

Example:

```
images/dashboard1.png
images/dashboard2.png
```

---

# 🚀 Key Insights

Some major findings from the analysis include:

- Property prices vary significantly across districts.
- Rental prices show a strong positive relationship with resale prices.
- Properties closer to metro stations and city centers generally command higher prices.
- Listing activity differs substantially across districts.
- Mortgage rates exhibit an observable relationship with housing market trends.
- District-level analysis identifies areas with higher rental yields and investment potential.

---

# 👨‍💻 Author

**Ranit Karmakar**

B.Tech in Computer Science & Engineering (Data Science)

Techno Main Salt Lake

GitHub: https://github.com/Ranit-2312

LinkedIn: https://www.linkedin.com/in/ranit-karmakar-497980338

---

## ⭐ If you found this project useful, consider giving it a Star!
