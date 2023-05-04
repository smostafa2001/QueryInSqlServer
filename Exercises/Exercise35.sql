DROP VIEW IF EXISTS dbo.OrderCount_Year;
GO

CREATE VIEW dbo.OrderCount_Year
AS
(
	SELECT
		YEAR(O.OrderDate) AS OrderYear,
		COUNT(O.OrderID) AS Num
	FROM dbo.Orders AS O
	GROUP BY YEAR(O.OrderDate)
);
GO

SELECT * FROM dbo.OrderCount_Year AS OCY
	WHERE OCY.OrderYear = 2014;
GO

DROP TABLE IF EXISTS dbo.TestTbl;
GO

CREATE TABLE dbo.TestTbl (ID INT);
GO

INSERT INTO dbo.TestTbl
	VALUES (100), (200), (300);
GO

DROP VIEW IF EXISTS dbo.All_Fields;
GO

CREATE VIEW dbo.All_Fields
AS
	SELECT * FROM dbo.TestTbl;
GO

SELECT * FROM dbo.All_Fields;
GO

SELECT * FROM dbo.All_Fields;
GO

ALTER TABLE dbo.TestTbl
	ADD Code INT IDENTITY;
GO

SELECT * FROM dbo.TestTbl;
GO

SELECT * FROM dbo.All_Fields;
GO

EXEC sp_refreshview 'All_Fields';
GO

EXEC sp_refreshsqlmodule 'dbo.All_Fields';
GO

SELECT * FROM dbo.All_Fields;
GO

ALTER VIEW dbo.All_Fields
AS
	SELECT
		ID, Code
	FROM dbo.TestTbl AS T;
GO

SELECT * FROM dbo.All_Fields;
GO

sp_helptext 'dbo.All_Fields';
GO

SELECT * FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'All_Fields';
GO

SELECT * FROM sys.sql_modules
	WHERE object_id = object_id('All_Fields');
GO

DROP VIEW IF EXISTS
	dbo.Employees_OrderCount, dbo.Range_Employees_OrderCount;
GO

CREATE VIEW dbo.Employees_OrderCount
AS
(
	SELECT
		EmployeeID,
		COUNT(OrderID) AS Num
	FROM dbo.Orders
	GROUP BY EmployeeID
);
GO

CREATE VIEW dbo.Range_Employees_OrderCount
AS
(
	SELECT * 
	FROM dbo.Employees_OrderCount
		WHERE Num > 100
);
GO