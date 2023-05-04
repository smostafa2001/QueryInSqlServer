USE NikamoozDB;
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region = N'جنوب';
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region <> N'جنوب';
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region = NULL;
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE NOT Region = NULL;
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region IS NULL;
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region IS NOT NULL;
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE Region <> N'جنوب'
	OR Region IS NULL;
GO

DECLARE @str1 VARCHAR(100) = NULL;
SELECT ISNULL(@str1, 'NULL VALUE');
GO

SELECT
	CustomerID, [State], Region, City
FROM dbo.Customers
	WHERE ISNULL(Region, '') <> N'جنوب';
GO

DROP TABLE IF EXISTS CheckConstraint;
GO

CREATE TABLE CheckConstraint
(
	Id	INT NOT NULL IDENTITY,
	Family	NVARCHAR(100),
	Score	INT CONSTRAINT CHK_POSITIVE1 CHECK(Score >= 0)
);
GO

INSERT INTO dbo.CheckConstraint(Family, Score)
	VALUES (N'سعیدی', 100);
GO

INSERT INTO dbo.CheckConstraint(Family)
	VALUES (N'پرتوی');
GO

--DOES'NT ACCEPT!
INSERT INTO dbo.CheckConstraint(Family)
	VALUES(N'احمدی', -10);
GO

--ALL AT ONCE
SELECT
	OrderID,
	YEAR(OrderDate) AS OrderYear,
	YEAR(OrderDate) + 1 AS NextYear
FROM dbo.Orders;
GO