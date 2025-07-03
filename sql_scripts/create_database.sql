CREATE DATABASE inventory_project;
USE inventory_project;

CREATE TABLE Raw_Inventory (
    Date DATE,
    Store_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Inventory INT,
    Units_Sold INT,
    Units_Ordered INT,
    Demand_Forecast DECIMAL(10,2),
    Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Weather_Condition VARCHAR(20),
    Holiday_Promotion BOOLEAN,
    Competition DECIMAL(5,2),
    Seasonality VARCHAR(20)
);

DESCRIBE Raw_Inventory;

