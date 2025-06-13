# Exploratory-Data-Analysis
Hello everybody. Let's explore the data we have cleaned using SQL.

This project showcases my ability to explore, clean, and analyze real-world data using **SQL**. Using a dataset on global layoffs, I performed a complete EDA pipeline to extract meaningful insights and prepare the data for visualization.

## 🔧 Tools & Technologies
- MySQL
- MySQL Workbench
- SQL (CTEs, JOINS, Window Functions, Aggregations)

---

## 🗂️ Dataset
The dataset used was already cleaned. It contains information on:
- Company name
- Industry
- Country
- Date of Layoff
- Number of layoffs
- Stage of funding
- Total employees before layoff
- % laid off, and more.

---

## 🔍 Exploratory Analysis
Some of the key questions I answered using SQL:
- What are the top countries and companies affected by layoffs?
- Which industries were hit the hardest?
- What is the trend of layoffs over time?

Used:
- `GROUP BY` with aggregates (`SUM`, `AVG`, `COUNT`)
- `ORDER BY` to identify top contributors
- `CASE WHEN` for conditional logic
- CTEs and subqueries for modular query writing
- Window functions like `RANK()` to rank companies

---

## 📊 Sample Insights
-  USA had the highest number of layoffs, followed by India and Canada.
-  Companies like Google, Meta, and Amazon were among the top affected.
-  Layoffs peaked during [insert period, e.g., Q1 2023].
-  Startups in **Series B/C funding** faced more aggressive downsizing.

Thanks for checking out my project! 😊








