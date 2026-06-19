  --SELECT
--All Record
SELECT *
FROM sales_data_sample

UPDATE sales_data_sample
SET ADDRESSLINE2 = 'Unknown'
WHERE ADDRESSLINE2 IS NULL;

UPDATE sales_data_sample
SET State = 'Unknown'
WHERE State IS NULL;

UPDATE sales_data_sample
SET Sales = 0
WHERE Sales IS NULL;

UPDATE sales_data_sample
SET POSTALCODE = 0
WHERE POSTALCODE IS NULL;

--Selected Columns
SELECT ORDERNUMBER,
       CUSTOMERNAME,
       COUNTRY,
       SALES
FROM sales_data_sample

      --WHERE

--Sales from the USA
SELECT *
FROM sales_data_sample
WHERE COUNTRY = 'USA'

--Orders Where Sales are Greater than 5000
SELECT *
FROM sales_data_sample
WHERE SALES > 5000;

--Shipped Orders
SELECT *
FROM sales_data_sample
WHERE STATUS = 'Shipped'

    -- ORDER BY

--Sort sales from highest to lowest
SELECT ORDERNUMBER,
       CUSTOMERNAME,
       SALES
FROM sales_data_sample
ORDER BY SALES DESC

--Sort customers alphabetically
SELECT CUSTOMERNAME,
       COUNTRY
FROM sales_data_sample
ORDER BY CUSTOMERNAME ASC

       --GROUP BY

   --Total sales by country
   SELECT COUNTRY,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY COUNTRY

--Count customers by country
SELECT COUNTRY,
       COUNT(*) AS TotalOrders
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY TotalOrders Desc

--Average sales by product line
SELECT PRODUCTLINE,
       AVG(SALES) AS AverageSales
FROM sales_data_sample
GROUP BY PRODUCTLINE

   --HAVING

--Countries with total sales above 100,000
SELECT COUNTRY,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY COUNTRY
HAVING SUM(SALES) > 100000
Order by TotalSales desc

--Product lines with more than 50 orders.
SELECT PRODUCTLINE,
       COUNT(*) AS NumberOfOrders
FROM sales_data_sample
GROUP BY PRODUCTLINE
HAVING COUNT(*) > 50

--Aggregate Functions

  --Total Sales
SELECT SUM(SALES) AS TotalSales
FROM sales_data_sample

--Average Sales
SELECT AVG(SALES) AS AverageSales
FROM sales_data_sample

--Number of Orders
SELECT COUNT(*) AS TotalOrders
FROM sales_data_sample

--Highest Sale
SELECT MAX(SALES) AS HighestSale
FROM sales_data_sample

--Lowest Sale
SELECT MIN(SALES) AS LowestSale
FROM sales_data_sample

--Sales by Year
SELECT YEAR_ID,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY YEAR_ID
ORDER BY YEAR_ID;  

--Sales by Product Line
SELECT PRODUCTLINE,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY TotalSales DESC;

--Orders by Deal Size
SELECT DEALSIZE,
       COUNT(*) AS NumberOfOrders
FROM sales_data_sample
GROUP BY DEALSIZE;
 
--Top 5 Countries by Sales
SELECT TOP 5 COUNTRY,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY TotalSales DESC

--Top 10 Customers by Sales
SELECT Top 10 CUSTOMERNAME,
       SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY TotalSales DESC

