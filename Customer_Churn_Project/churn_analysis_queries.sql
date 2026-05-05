/* Project: Customer Churn Analysis
Goal: Identifying key drivers of customer attrition to improve retention.
Author: B. Siva Teja
*/
/* Creating Database
*/
CREATE DATABASE ChurnProject;
/* using database
*/
USE ChurnProject;
/*Verify the Data (The Confirmation)
*/
SELECT * FROM customers LIMIT 10;
/*
Overall Churn Rate
*/
SELECT Churn, COUNT(*) AS Total_Customers, 
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS Percentage
FROM customers
GROUP BY Churn;
/* 
Contract Impact (High-Value Insight):
*/
SELECT Contract, COUNT(*) AS Churned_Users
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY Churned_Users DESC;
/*
Payment Method & Churn:
*/
SELECT PaymentMethod, COUNT(*) AS Churned_Users
FROM customers
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY Churned_Users DESC;