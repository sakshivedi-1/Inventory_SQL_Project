USE inventory_project;
-- problem 1
-- Low Inventory Detection
-- Stockouts of fast-moving products → Missed sales & poor experience
-- Low Inventory Alert (Assuming reorder threshold = 30 units)
SELECT 
    Date,
    Store_ID,
    Product_ID,
    Inventory,
    Demand_Forecast,
    Units_Ordered
FROM Raw_Inventory
WHERE Inventory < 30
ORDER BY Inventory ASC;

-- problem 2
-- Overstocking of Slow-Moving Items
-- Slow-moving items → Blocked capital & storage cost

-- Identify Overstocked but Low-Selling Items
SELECT 
    Product_ID,
    Category,
    AVG(Inventory) AS Avg_Inventory,
    AVG(Units_Sold) AS Avg_Units_Sold
FROM Raw_Inventory
GROUP BY Product_ID, Category
HAVING Avg_Inventory > 100 AND Avg_Units_Sold < 10
ORDER BY Avg_Inventory DESC;

-- problem 3
-- Reorder Point Estimation
-- No clear reorder logic → Missed restocking timing
-- Estimate reorder point based on average daily sales
SELECT 
    Product_ID,
    Category,
    ROUND(AVG(Units_Sold), 2) AS Avg_Daily_Sales,
    ROUND(AVG(Units_Sold) * 5, 2) AS Recommended_Reorder_Point -- Assuming 5-day lead time
FROM Raw_Inventory
GROUP BY Product_ID, Category;

-- problem 4
-- Inventory Turnover Ratio
-- Poor SKU performance visibility
SELECT 
    Store_ID,
    Product_ID,
    ROUND(SUM(Units_Sold), 0) AS Total_Sold,
    ROUND(AVG(Inventory), 2) AS Avg_Inventory,
    ROUND(SUM(Units_Sold) / NULLIF(AVG(Inventory), 0), 2) AS Inventory_Turnover
FROM Raw_Inventory
GROUP BY Store_ID, Product_ID
ORDER BY Inventory_Turnover DESC;

-- problem 5
-- Fast vs Slow Moving Products
-- No insights into product velocity

SELECT 
    Product_ID,
    Category,
    ROUND(SUM(Units_Sold), 0) AS Total_Sold,
    CASE 
        WHEN SUM(Units_Sold) > 1000 THEN 'Fast-Moving'
        WHEN SUM(Units_Sold) BETWEEN 200 AND 1000 THEN 'Moderate'
        ELSE 'Slow-Moving'
    END AS Product_Speed
FROM Raw_Inventory
GROUP BY Product_ID, Category
ORDER BY Total_Sold DESC;

-- problem 6 
-- Forecast Accuracy Analysis
-- Demand forecast not used → missed optimization
SELECT 
    Product_ID,
    ROUND(AVG(Demand_Forecast), 1) AS Avg_Forecast,
    ROUND(AVG(Units_Sold), 1) AS Avg_Sold,
    ROUND(AVG(Demand_Forecast - Units_Sold), 1) AS Forecast_Error
FROM Raw_Inventory
GROUP BY Product_ID
ORDER BY ABS(Forecast_Error) DESC;

