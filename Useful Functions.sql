/*
Useful SQL Functions
********************
Objective: Introduce several common, very useful SQL functions
We will see these used in the lab exercises later in the course.
These are shown with simplest possible example, usually using values as arguments but
in practice, the arguments will be column names
*/
 
/*
Date functions include DATEFROMPARTS, DATENAME, DATEPART, DATEADD, DATEDIFF, YEAR, MONTH, DAY
*/
-- CURRENT_TIMESTAMP and GETDATE() return the current date and time
-- CAST a datetime value to a date datatype to return the date (without any time component)

SELECT CURRENT_TIMESTAMP AS TheDateTimeNow;
SELECT GETDATE() AS TheDateTimeNow;
SELECT CAST(GETDATE() AS DATE) AS TodaysDate;
 
-- DATENAME() returns part of a date as a string
-- See https://www.w3schools.com/sql/func_sqlserver_datename.asp for interval argument examples

SELECT m.MessageId
    , m.ReceivedDate
    , DATENAME(WEEKDAY, m.ReceivedDate) AS ReceivedWeekDay
FROM Message m;
 
-- DATEPART() returns part of a date as a number
SELECT m.MessageId
    , m.ReceivedDate
    , DATEPART(MONTH, m.ReceivedDate) AS ReceivedMonth -- can use 'WEEKDAY' 'MONTH; or 'YEAR'
FROM Message m;
 
-- DATEFROMPARTS() Returns a date given the year, month number and day of month
SELECT DATEFROMPARTS(2022, 5, 18) AS TheDate;
 
-- FORMAT returns a string given a data and a format specifier 
SELECT FORMAT(DATEFROMPARTS(2022, 1, 18), 'dd-MMM-yyyy');
SELECT FORMAT(DATEFROMPARTS(2022, 5, 18), 'dddddddd dd-MMM-yy');
 
-- DATEADD adds an interval to a date
-- Note that SQL will understand a string with a yyyy-mm-dd format as a date
SELECT DATEADD(WEEK, 3, '2022-05-18');
SELECT DATEADD(MONTH, -1, '2025-03-31');
 
-- DATEDIFF() will return the number of intervals between two dates
SELECT DATEDIFF(DAY, '2022-06-10', '2022-07-12');
SELECT DATEDIFF(WEEK, '2022-06-10', '2022-08-17');

SQL Server DATENAME() Function
Well organized and easy to understand Web building tutorials with lots of examples of how to use HTML, CSS, JavaScript, SQL, Python, PHP, Bootstrap, Java, XML and more.
 
 