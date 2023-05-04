USE NikamoozDB;
GO

SELECT
	CustomerID, City
FROM dbo.Customers
	WHERE City IN (N'', N'');
GO

SELECT
	EmployeeID, OrderID
FROM dbo.Orders
	WHERE EmployeeID IN
	(
		SELECT
			E.EmployeeID
		FROM dbo.Employees AS E
			WHERE E.LastName LIKE N' %'
	);
GO

SELECT
	C.*
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE O.OrderID IS NULL;
GO

SELECT
	C.*
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	AND O.OrderID IS NULL;
GO

SELECT
	C.*
FROM dbo.Customers AS C
	WHERE CustomerID NOT IN
	(
		SELECT
			CustomerID
		FROM dbo.Orders
	);
GO

SELECT
	C.*
FROM dbo.Customers AS C
	WHERE CustomerID NOT IN
	(
		SELECT DISTINCT
			CustomerID
		FROM dbo.Orders
	);
GO

USE AdventureWorks2017;
GO

SELECT *
FROM Production.Product
	WHERE ProductID NOT IN
	(
		SELECT DISTINCT ProductID
		FROM Sales.SalesOrderDetail
	);
GO

SELECT *
FROM Production.Product
	WHERE ProductID NOT IN
	(
		SELECT ProductID
		FROM Sales.SalesOrderDetail
	);
GO

USE NikamoozDB;
GO

SELECT *
FROM dbo.Customers
	WHERE Region IN (N'„—ò“');
GO

SELECT *
FROM dbo.Customers
	WHERE Region IN (NULL);
GO

SELECT *
FROM dbo.Customers
	WHERE Region IS NULL;
GO

SELECT *
FROM dbo.Customers
	WHERE Region IN (N'„—ò“', NULL);
GO

SELECT *
FROM dbo.Customers
	WHERE Region = N'„—ò“'
	OR Region IS NULL;
GO

SELECT *
FROM dbo.Customers
	WHERE Region NOT IN (N'„—ò“', NULL)
ORDER BY Region DESC;
GO

SELECT *
FROM dbo.Customers
	WHERE Region <> N'„—ò“' AND Region IS NOT NULL
ORDER BY Region DESC;
GO

SELECT *
FROM dbo.Customers
	WHERE Region NOT IN (N'„—ò“', N'€—»')
ORDER BY Region DESC;
GO