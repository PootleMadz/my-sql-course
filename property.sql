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
FROM PricePaidSW12 p
WHERE 
    p.Street = 'Cambray Road'
  AND p.Price BETWEEN 400000 AND 500000
  AND p.TransactionDate BETWEEN '2018-01-01' AND '2018-12-31' 
ORDER BY p.TransactionDate;

