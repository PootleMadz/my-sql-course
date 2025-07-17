/*
String functions
*/
 
/*
CONCAT - appends several  columns / values together.  
Implicity converts these to string saving us the trouble
Note that the + operator can concatenate strings but all datatypes must be strings 
*/
SELECT
	m.MessageId
	, m.ReceivedDate
	, m.Region
	, m.Category
	, m.Movement
	, CONCAT(m.MessageId, m.Region, m.ReceivedDate, m.Movement) AS Combined
    ,  CAST(m.MessageId AS VARCHAR) + m.Region + CAST(m.ReceivedDate AS VARCHAR) + CAST(m.Movement AS VARCHAR) AS CombinedWithPlus
FROM Message m;
 
-- LEFT returns the first number_of_chars 
SELECT
	m.MessageId
	, m.Region
	, LEFT(m.Region, 3) AS RegionCode
FROM
	Message m;
 
-- SUBSTRING returns a part of the string
SELECT
	m.MessageId
	, m.Region
	,SUBSTRING(m.Region, 1, 3) AS RegionPart
FROM 
Message m;
 
-- LEN returns the length of a string
SELECT
	m.MessageId
	, m.Region
	, LEN(m.Region) AS RegionLength
FROM
	Message m;