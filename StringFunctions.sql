USE NikamoozDB;
GO

SELECT LEN(N'سلام');
SELECT DATALENGTH(N'سلام');

SELECT LEN('A');
SELECT DATALENGTH('A');
GO

SELECT DATALENGTH(N'A');
GO

SELECT LEN(N'My String    ');
SELECT DATALENGTH(N'My String    ');
GO

SELECT UPPER('my sTRing');
SELECT LOWER('my sTRing');
GO

SELECT RTRIM(' STR '), LEN(RTRIM(' STR '));
SELECT LTRIM(' STR '), LEN(LTRIM(' STR '));
SELECT RTRIM(LTRIM(' STR ')), LEN(RTRIM(LTRIM(' STR ')));
GO

SELECT LEFT(N'علی رضا', 3);
SELECT RIGHT(N'علی رضا', 3);
SELECT LEFT('ABCD', 3);
SELECT LEFT(N'ABCD', 3);
SELECT RIGHT(N'ABCD', 3);
GO

SELECT SUBSTRING('My String', 1, 2);
GO

SELECT CHARINDEX(' ', N'امیر حسین سعیدی');
GO

SELECT CHARINDEX(N'ید', N'امیر حسین سعیدی');
GO

SELECT CHARINDEX(N'یک', N'امیر حسین سعیدی');
GO

SELECT PATINDEX('[0-9]%', '3ab12cd34ef56gh');
GO

SELECT PATINDEX('[0-9]%', 'a4b12cd34ef56gh');
GO

SELECT PATINDEX('%[4-6]%', '3ab12cd34ef56gh');
GO

SELECT REPLACE('my-string    is-simple!', '-', ' ');
GO

SELECT REPLICATE('abc', 3);
GO

SELECT STUFF('Test', 2, 1, N'***');
GO

DECLARE @MyStr VARCHAR(30);
SET @MyStr = 'SQL Server Management Studio';
SELECT STUFF(@MyStr, 1, LEN(@MyStr), 'SSMS');
GO

SELECT
	EmployeeID, FirstName + N'-' + LastName AS FullName
FROM dbo.Employees;
GO

SELECT CONCAT('my', ',', 'String', ',', 'is', ',', 'simple', '!');
GO

SELECT 'A' + NULL + '-' + 'B';
SELECT CONCAT('A', NULL, '-', 'B');
GO

SELECT
	CustomerID, [State], Region, City,
	CONCAT([State], '*', Region, '*', City) AS Customer_Location
FROM dbo.Customers;
GO

SELECT
	CustomerID, [State], Region, City,
	ISNULL([State], '') + '*' + ISNULL(Region, '') + '*' + City AS Customer_Location
FROM dbo.Customers;
GO