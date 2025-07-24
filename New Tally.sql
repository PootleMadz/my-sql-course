 * The temporary table, #PatientAdmission, has values for dates between the 1st and 8th January inclusive
 * But not all dates are present
 */
 
DROP TABLE IF EXISTS #PatientAdmission;
CREATE TABLE #PatientAdmission (AdmittedDate DATE, NumAdmissions INT);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-01', 5)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-02', 6)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-03', 4)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-05', 2)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-08', 2)
SELECT * FROM #PatientAdmission
 
/*
 * Exercise: create a resultset that has a row for all dates in that period
 * of 8 days with NumAdmissions set to 0 for missing dates.
 You may wish to use the SQL statements below to set the start and end dates
 */
 
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
 
-- write your answer here
 
/*
 * Exercise: list the dates that have no patient admissions
*/
 
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
 
-- write your answer here
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
DECLARE @NumDays INT = DATEDIFF(DAY, @StartDate, @EndDate) + 1;
SELECT
    DATEADD(DAY, N-1, @StartDate) AS AdmittedDate
FROM
    Tally
WHERE N <= @NumDays
ORDER BY N;

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
DECLARE @NumDays INT = DATEDIFF(DAY, @StartDate, @EndDate) + 1;
SELECT
    DATEADD(DAY, N-1, @StartDate) AS AdmittedDate
FROM
    Tally
WHERE N <= @NumDays
ORDER BY N;
 
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
DECLARE @NumDays INT = DATEDIFF(DAY, @StartDate, @EndDate) + 1; 
SELECT
    DATEADD(DAY, N-1, @StartDate) AS AdmittedDate
into #Dates
FROM
    Tally
WHERE N <= @NumDays
ORDER BY N;
 
select * from #Dates d

DECLARE #PatientAdmision
SELECT d.AdmittedDate 
FROM #Dates d
WHERE d.AdmittedDate NOT IN 
    (SELECT p.AdmittedDate FROM #PatientAdmision p)


SELECT
*
FROM #Dates d
DECLARE #PatientAdmision
SELECT 
d.AdmittedDate
FROM 
#Dates d
--
WHERE NOT EXISTS
    (SELECT * FROM #PatientAdmission p WHERE d.AdmittedDate)


SELECT D.DATE d

 FROM #dates d
 LEFT JOIN #PatientAdmission p ON p.AdmittedDate
 WHERE p.AdmittedDate is NULL

