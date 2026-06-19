   --SELECT

--Retrieve customer information from the database
SELECT FirstName, LastName, Country 
FROM Customer;

    --WHERE

--Filter invoices to include only customers located in the United
SELECT * FROM Invoice 
WHERE BillingCountry = 'USA';

   --ORDER BY

--Sort invoices from the highest value to the lowest
SELECT InvoiceId, Total 
FROM Invoice 
ORDER BY Total DESC;

  --GROUP BY

--Group invoices by country and count the number of invoices in each location
SELECT BillingCountry, COUNT(*) AS TotalInvoices 
FROM Invoice
GROUP BY BillingCountry;

  --HAVING

--Display only countries whose total revenue exceeds 100
SELECT BillingCountry, SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100; 

 --Aggregate Functions
--SUM()

--Calculates the total revenue generated from all customer invoices
SELECT SUM(Total) AS TotalRevenue 
FROM Invoice

  --AVG()
  --Measures the average value of customer purchases, providing an indication of typical spending behavior
SELECT AVG(Total) AS AverageInvoiceValue 
FROM Invoice


  --COUNT()
  --Determines the total number of invoices processed, which can be used to measure sales volume
SELECT COUNT(*) AS TotalInvoices 
FROM Invoice

 --INNER JOIN

 --An INNER JOIN returns only the records that have matching values in both tables
 SELECT
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId

--Top-Performing Customers

--Which customers generated the highest revenue?
SELECT Top 10
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalRevenue
FROM Customer c
INNER JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalRevenue DESC

--Top-Performing Products

--Which tracks generated the highest sales?
SELECT Top 10
    t.Name AS TrackName,
    COUNT(il.TrackId) AS TimesPurchased
FROM Track t
INNER JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY TimesPurchased DESC

--Revenue Trends Over Time

--How has revenue changed over the years?
SELECT
    YEAR(InvoiceDate) AS SalesYear,
    SUM(Total) AS Revenue
FROM Invoice
GROUP BY YEAR(InvoiceDate)
ORDER BY SalesYear

--Customer Purchasing Behavior

--How much does each customer spend on average?
SELECT
    c.FirstName,
    c.LastName,
    COUNT(i.InvoiceId) AS TotalPurchases,
    AVG(i.Total) AS AveragePurchase,
    SUM(i.Total) AS TotalSpent
FROM Customer c
INNER JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

--Revenue by Country

--Which countries generate the most revenue?
SELECT
    BillingCountry,
    SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY Revenue DESC

--Most Popular Music Genres

--Which music genres are purchased most frequently?
SELECT
    g.Name AS Genre,
    COUNT(il.InvoiceLineId) AS Purchases
FROM Genre g
INNER JOIN Track t
    ON g.GenreId = t.GenreId
INNER JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
GROUP BY g.GenreId, g.Name
ORDER BY Purchases DESC

--