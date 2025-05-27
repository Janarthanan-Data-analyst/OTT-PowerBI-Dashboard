# OTT User Retention & Revenue Analysis Dashboard 🎬📊

This project presents a business-focused Power BI dashboard built on OTT (Netflix-like) user data, highlighting churn behavior, revenue distribution, and user demographics.


## 📂 Project Files

| File                            | Description                                      |
|----------------------------------|--------------------------------------------------|
| `OTT_Analysis_Dashboard.pbix`     | Power BI dashboard file                          |
| `OTT_Analysis_SQL.sql`            | SQL scripts for cleaning and transformation      |
| `dashboard_overview.png`        | Screenshot of full dashboard                     |
| `README.md`                     | Documentation (this file)                        |

## 📊 Key Insights
- Churn rate by subscription type
- Revenue lost vs retained based on user churn
- Age group segmentation
- Gender-wise and country-wise analysis
- Subscription-level monthly income

## ⚙️ Tools Used
- **SQL (Oracle 11g)**: For data cleaning and churn flag generation
- **Power BI**: For visualization and DAX calculations
- **DAX**: Used for Age grouping, Churn categorization, Revenue measures
## 🔍 SQL Work Highlights

This is **not just a Power BI project** — this is a **SQL-centric analytics solution**. All cleaning and logic were handled in Oracle SQL before visualization.

### ✅ SQL Tasks Performed

- ✅ Cleaned inconsistent `gender`, `age`, and `revenue` values
- ✅ Handled missing or invalid `last_payment_date` formats
- ✅ Created **churn flag** using payment recency logic:
  ```sql
  CASE 
    WHEN SYSDATE - last_payment_date > 30 THEN 'Yes'
    ELSE 'No'
  END AS churn_flag
  
## 📌 Summary
This dashboard allows business users to identify user trends, churn risks, and revenue loss areas in order to make informed strategic decisions.

## 💡 Skills Demonstrated
`SQL`, `Power BI`, `DAX`, `Churn Analysis`, `Data Visualization`, `Business Analytics`

