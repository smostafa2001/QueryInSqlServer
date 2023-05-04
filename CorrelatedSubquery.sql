USE NikamoozDB;
GO

SELECT
	CustomerID,
	MAX(OrderID) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	CustomerID,
	(
		SELECT
			MAX(OrderID) 
		FROM dbo.Orders
	) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	CustomerID,
	OrderID
FROM dbo.Orders
	WHERE OrderID = 
		(SELECT MAX(OrderID) FROM dbo.Orders)
GROUP BY CustomerID;
GO

SELECT DISTINCT
	O1.CustomerID,
	(
		SELECT
			MAX(O2.OrderID)
		FROM dbo.Orders AS O2
			WHERE O1.CustomerID = O2.CustomerID
	) AS NewOrder
FROM dbo.Orders AS O1
ORDER BY O1.CustomerID;
GO

SELECT
	O1.CustomerID,
	(
		SELECT
			MAX(O2.OrderID)
		FROM dbo.Orders AS O2
			WHERE O1.CustomerID = O2.CustomerID
	) AS NewOrder
FROM dbo.Orders AS O1
GROUP BY O1.CustomerID
ORDER BY O1.CustomerID;
GO

SELECT
	C.CustomerID,
	(
		SELECT
			MAX(O.OrderDate)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS NewOrder
FROM dbo.Customers AS C;
GO

SELECT
	O1.CustomerID,
	O1.OrderID
FROM dbo.Orders AS O1
	WHERE O1.OrderID =
		(
			SELECT
				MAX(O2.OrderID)
			FROM dbo.Orders AS O2
				WHERE 
					O1.CustomerID = O2.CustomerID
		);
GO

SELECT
	CustomerID,
	MAX(OrderID) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	O1.CustomerID,
	O1.OrderID
FROM Sales.Orders AS O1
	WHERE O1.OrderID =
		(
			SELECT
				MAX(O2.OrderID)
			FROM Sales.Orders AS O2
				WHERE 
					O1.CustomerID = O2.CustomerID
		);
GO

SELECT
	CustomerID,
	MAX(OrderID) AS NewOrder
FROM Sales.Orders
GROUP BY CustomerID;
GO

USE AdventureWorks2017;
GO

SELECT * FROM Sales.SalesOrderHeader;
GO

SELECT
	SalesPersonID,
	MAX(OrderDate) AS NewOrder
FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID;
GO

SELECT
	SOH1.SalesPersonID,
	SOH1.OrderDate
FROM Sales.SalesOrderHeader AS SOH1
	WHERE SOH1.SalesOrderID =
		(
			SELECT
				MAX(SOH2.SalesOrderID)
			FROM Sales.SalesOrderHeader AS SOH2
				WHERE 
					SOH1.SalesPersonID = 
						SOH2.SalesPersonID
		);
GO

USE NikamoozDB;
GO

