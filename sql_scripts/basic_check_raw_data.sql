USE inventory_project;

SELECT COUNT(*) AS Total_Rows
FROM Raw_Inventory;

-- Top 10 rows
SELECT *
FROM Raw_Inventory
LIMIT 10;

-- Null Values Check

SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Null_Date,
    SUM(CASE WHEN Store_ID IS NULL THEN 1 ELSE 0 END) AS Null_Store_ID,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Null_Product_ID,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Null_Category,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Null_Region,
    SUM(CASE WHEN Inventory IS NULL THEN 1 ELSE 0 END) AS Null_Inventory,
    SUM(CASE WHEN Units_Sold IS NULL THEN 1 ELSE 0 END) AS Null_Units_Sold,
    SUM(CASE WHEN Units_Ordered IS NULL THEN 1 ELSE 0 END) AS Null_Units_Ordered,
    SUM(CASE WHEN Demand_Forecast IS NULL THEN 1 ELSE 0 END) AS Null_Demand_Forecast,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS Null_Price,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Null_Discount,
    SUM(CASE WHEN Weather_Condition IS NULL THEN 1 ELSE 0 END) AS Null_Weather_Condition,
    SUM(CASE WHEN Holiday_Promotion IS NULL THEN 1 ELSE 0 END) AS Null_Holiday_Promotion,
    SUM(CASE WHEN Competition IS NULL THEN 1 ELSE 0 END) AS Null_Competition,
    SUM(CASE WHEN Seasonality IS NULL THEN 1 ELSE 0 END) AS Null_Seasonality
FROM Raw_Inventory;



SELECT DISTINCT Store_ID
FROM Raw_Inventory;


SELECT DISTINCT Category
FROM Raw_Inventory;