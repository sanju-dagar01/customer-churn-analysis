#CREATE DATABASE customer_churn_db;
USE customer_churn_db;

Select * from customer_churn;
    
# Total Customers
SELECT COUNT(*) AS Total_Customers
FROM customer_churn;

# Churn Customers
SELECT COUNT(*) AS Churn_Customers
FROM customer_churn
WHERE Churn='Yes';

# Churn rate
SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100/COUNT(*),2) AS Churn_Rate
FROM customer_churn;

# Contract Wise Customers
SELECT
Contract,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Contract
ORDER BY Total_Customers DESC;

# Internet service wise churn
SELECT
InternetService,
Churn,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY InternetService, Churn;

# Payment method analysis
SELECT
PaymentMethod,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Customers DESC;

# Average monthly charges
SELECT
ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM customer_churn;

# Average Tenure
SELECT
ROUND(AVG(tenure),2) AS Avg_Tenure
FROM customer_churn;

# Senior citizen churn
SELECT
SeniorCitizen,
Churn,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY SeniorCitizen, Churn;

# Top 10 Highest paying customers
SELECT
customerID,
MonthlyCharges,
TotalCharges
FROM customer_churn
ORDER BY TotalCharges DESC
LIMIT 10;
