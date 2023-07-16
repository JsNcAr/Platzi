CREATE TABLE IF NOT EXISTS orders (
    Row_ID INT(5) NOT NULL,
    Order_ID VARCHAR(15) NOT NULL,
    Order_Date DATE NOT NULL,
    Ship_Date DATE NOT NULL,
    Ship_Mode VARCHAR(30) NOT NULL,
    Customer_ID VARCHAR(10) NOT NULL,
    Customer_Name VARCHAR(50) NOT NULL,
    Segment VARCHAR(35) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Postal_Code VARCHAR(8) NOT NULL,
    Region VARCHAR(25) NOT NULL,
    Product_ID VARCHAR(25) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Sub_Category VARCHAR(100) NOT NULL,
    Product_Name VARCHAR(255) NOT NULL,
    Sales FLOAT(11) NOT NULL,
    Quantity INT(11) NOT NULL,
    Discount FLOAT(11) NOT NULL,
    Profit FLOAT(11) NOT NULL,
    Delivery_Time INT(11) NOT NULL,
    PRIMARY KEY (Row_ID)
);


-- Check delivery time by ship mode
SELECT Ship_Mode, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY Ship_Mode
ORDER BY Delivery_Time DESC;

-- check delivery time by year
SELECT YEAR(Order_Date) AS Year, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY Year
ORDER BY Year DESC;

-- check delivery time by category
SELECT Category, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY Category
ORDER BY Delivery_Time DESC;

-- check delivery time by segment
SELECT Segment, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY Segment
ORDER BY Delivery_Time DESC;

-- check delivery time by city
SELECT City, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY City
ORDER BY Delivery_Time DESC;

-- create table for delivery time by state
CREATE TABLE IF NOT EXISTS city_time 
(City VARCHAR(100), Delivery_Time FLOAT, Latitude FLOAT, Longitude FLOAT, State VARCHAR(100));

-- check delivery time by state

SELECT State, AVG(Delivery_Time) AS Delivery_Time FROM orders GROUP BY State
ORDER BY Delivery_Time DESC;

