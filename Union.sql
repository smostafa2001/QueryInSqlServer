USE NikamoozDB;
GO

SELECT
	[State], Region, City
FROM dbo.Employees
UNION ALL
SELECT
	[State], Region, City
FROM dbo.Customers;
GO

SELECT
	[State], Region, City
FROM dbo.Employees
UNION
SELECT
	[State], Region, City
FROM dbo.Customers;
GO

SELECT
	[State] AS N'استان', Region, City
FROM dbo.Employees
UNION ALL
SELECT
	Region, City
FROM dbo.Customers;
GO

SELECT
	[State], Region, City
FROM dbo.Employees
ORDER BY Region
UNION ALL
SELECT
	[State], Region, City
FROM dbo.Customers;
GO

SELECT
	[State], Region, City
FROM dbo.Employees
UNION ALL
SELECT
	[State], Region, City
FROM dbo.Customers
ORDER BY Region;
GO

SELECT
	[State], Region, City
FROM dbo.Employees
UNION
SELECT
	[State], Region
FROM DBO.Customers

SELECT
	O.OrderDate
FROM DBO.Orders AS O
UNION
SELECT
	C.City
FROM dbo.Customers AS C

DROP TABLE IF EXISTS S01, S02;
GO

CREATE TABLE S01(ID TINYINT, Family NVARCHAR(50));
GO

CREATE TABLE S02(Code INT, Title NVARCHAR(10));
GO

INSERT INTO S01
	VALUES (1, N'احمدی'), (2, N'مشفق'), (3, N'جلالی'), (4, N'سلیمانی');
GO

INSERT INTO S02
	VALUES (10000, N'رئیس'), (20000, N'کارمند'), (30000, N'سرپرست');
GO

SELECT
	Tmp.Family,
	Tmp.ID,
	DATALENGTH(Tmp.Family) AS Family_Space,
	DATALENGTH(Tmp.ID) AS ID_Space
FROM
	(
		SELECT
		ID, Family
		FROM S01
		UNION
		SELECT
		Code, Title
		FROM S02
	) AS Tmp;
GO

INSERT INTO S01 VALUES (1, NULL);
GO

INSERT INTO S02 VALUES (1, NULL);
GO

SELECT
	ID, Family
FROM S01
UNION ALL
SELECT
	Code, Title
FROM S02;
GO

SELECT
	ID, Family
FROM S01
UNION
SELECT
	Code, Title
FROM S02;
GO

USE AdventureWorks2017;
GO

SELECT
	SalesOrderID,
	COUNT(SalesOrderID) AS Num
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
ORDER BY SalesOrderID, Num DESC;
GO

SELECT
	BusinessEntityID,
	COUNT(BusinessEntityID) AS Num
FROM Person.Person
GROUP BY BusinessEntityID
ORDER BY BusinessEntityID, Num DESC;
GO

SET STATISTICS IO ON;
GO

SELECT
	SalesOrderID
FROM Sales.SalesOrderHeader
UNION ALL
SELECT
	BusinessEntityID
FROM Person.Person
GO

SELECT
	SalesOrderID
FROM Sales.SalesOrderHeader
UNION
SELECT
	BusinessEntityID
FROM Person.Person;
GO