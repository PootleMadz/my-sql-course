SELECT
    p.PropertyType
    , COUNT(p.PropertyType) as NumberOfSales
FROM PricePaidSW12 p
GROUP BY p.PropertyType
ORDER BY NumberOfSales DESC


 -- number of sales by year
 -- What was the total market value in £ Millions of all the sales each year? 
 SELECT
    YEAR(p.transactionDate) AS TheYear
    ,COUNT(p.TransactionDate) AS NumberOfSales
    , SUM(p.Price)/1000000.0 AS MarketValue
FROM PricePaidSW12 p
    GROUP BY YEAR(p.TransactionDate)
    ORDER BY TheYear

-- What was the earliest and latest sale date in the dataset?
SELECT
    MIN(p.TransactionDate) AS EarliestSaleDate,
    MAX(p.TransactionDate) AS LatestSaleDate
FROM PricePaidSW12 p;

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road (a street in SW12)
SELECT
    p.TransactionDate
    ,p.Price
    ,p.Street
    ,p.PropertyType
FROM PricePaidSW12 p
WHERE 
    p.Street IN ('Cambray Road','Midmoor Road')
  AND p.Price > 400000
  AND p.TransactionDate BETWEEN '2017-01-01' AND '2018-12-31' 
  AND p.PropertyType = 'T'
ORDER BY p.TransactionDate;

-- Write a SQL query that lists the 25 latest sales in Ormeley Road with the following fields: TransactionDate, Price, PostCode, PAON
SELECT TOP 25
    p.TransactionDate
    ,p.Price    
    ,p.PostCode
    ,p.PAON
    ,p.PropertyType
FROM PricePaidSW12 AS p
WHERE p.Street = 'Ormeley Road'
ORDER BY p.TransactionDate DESC

/* There is a table named PropertyTypeLookup . 
This has columns PropertyTypeCode and PropertyTypeName. 
The values in PropertyTypeCode match those in the PropertyType column of The PricePaidSW12 table.
The values in PropertyTypeName are the full name of the property type e.g. Flat, Terraced*/

SELECT * FROM PropertyTypeLookup

-- Write a SQL query that joins on table  PropertyTypeLookup to include column PropertyTypeName in the result.
SELECT TOP 25
    p.TransactionDate
    ,p.Price    
    ,p.PostCode
    ,p.PAON
    ,pt.PropertyTypeName
FROM PricePaidSW12 p LEFT JOIN PropertyTypeLookup pt on p.PropertyType = pt.PropertyTypeCode
WHERE p.Street = 'Ormeley Road'
ORDER BY p.TransactionDate DESC

-- add in a new field
SELECT 
    TOP 25
    p.TransactionDate
    ,p.Price
    ,p.PostCode
    ,p.PAON
    ,p.propertyType
     ,CASE p.PropertyType  -- simple
        WHEN 'T' THEN 'Terraced'
        WHEN 'F' THEN 'Flat'
        ELSE 'Unkwown' 
    END as PropertyTypeName
    ,CASE  -- searched
        WHEN p.propertyType IN  ('D', 'S', 'T') THEN 'Freehold'
        ELSE 'Leasehold'
    END as PropertyDuration
FROM
    PricePaidSW12 AS p
WHERE Street = 'Ormeley Road'  -- a very nice street in Balham
ORDER BY TransactionDate DESC
