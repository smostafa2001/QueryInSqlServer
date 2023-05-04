USE NikamoozDB;
GO

SELECT
	C.CompanyName,
	COUNT(O.OrderID) AS Num
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
	HAVING COUNT(O.OrderID) > 10;
GO

SELECT
	(
		SELECT
			C.CompanyName
		FROM dbo.Customers AS C
			WHERE C.CustomerID = O.CustomerID
	) AS CompanyName,
	COUNT(OrderID) AS Num
FROM dbo.Orders AS O
GROUP BY O.CustomerID
	HAVING COUNT(OrderID) > 10;
GO

SELECT
	C.CompanyName,
	(
		SELECT COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
			HAVING COUNT(O.OrderID) > 10
	) AS Num
FROM dbo.Customers AS C;
GO

SELECT
	C.CompanyName,
	(
		SELECT COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C
	WHERE 
	(
		SELECT COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
	) > 10;
GO

SELECT
	Tmp.CompanyName,
	Tmp.Num
FROM
	(
		SELECT
			C.CompanyName,
			(
				SELECT COUNT(O.OrderID)
				FROM dbo.Orders AS O
					WHERE C.CustomerID = O.CustomerID
					HAVING COUNT(O.OrderID) > 10
			) AS Num
		FROM dbo.Customers AS C
	) AS Tmp
	WHERE Tmp.Num IS NOT NULL; 
GO

SELECT
	Tmp.CompanyName,
	Tmp.Num
FROM
	(
		SELECT
			C.CompanyName,
			(
				SELECT COUNT(O.OrderID)
				FROM dbo.Orders AS O
					WHERE C.CustomerID = O.CustomerID
			) AS Num
		FROM dbo.Customers AS C
	) AS Tmp
	WHERE Tmp.Num > 10; 
GO

SELECT *
FROM
	(
		SELECT
			CustomerID, CompanyName
		FROM dbo.Customers
			WHERE [State] = N'ÊåÑÇä'
		ORDER BY CustomerID
	) AS Tmp;
GO

SELECT *
FROM 
	(
		SELECT
			CustomerID, CompanyName + N'- ÊåÑÇä' AS CompName
		FROM dbo.Customers
			WHERE [State] = N'ÊåÑÇä'
	) AS Tmp;
GO

SELECT *
FROM
	(
		SELECT
			C.CustomerID, O.CustomerID AS O_CustomerID
		FROM dbo.Orders AS O
		JOIN dbo.Customers AS C
			ON C.CustomerID = O.CustomerID
	) AS Tmp;
GO

USE AdventureWorks2017;
GO

SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Sales.SalesOrderHeader;
GO

SELECT DISTINCT *
FROM
	(
		SELECT
			SOH.CustomerID,
			(
				SELECT
					COUNT(SOD.SalesOrderID)
				FROM Sales.SalesOrderDetail AS SOD
					WHERE SOH.SalesOrderID = SOD.SalesOrderID
					HAVING COUNT(SOD.SalesOrderID) > 5
			) AS Num
		FROM Sales.SalesOrderHeader AS SOH
	) AS Tmp
	WHERE Tmp.Num IS NOT NULL;
GO

SELECT DISTINCT *
FROM
	(
		SELECT
			SOH.CustomerID,
			(
				SELECT
					COUNT(SOD.SalesOrderID)
				FROM Sales.SalesOrderDetail AS SOD
					WHERE SOH.SalesOrderID = SOD.SalesOrderID
			) AS Num
		FROM Sales.SalesOrderHeader AS SOH
	) AS Tmp
	WHERE Tmp.Num > 5;
GO

USE NikamoozDB;
GO

SELECT
	O.CustomerID,
	COUNT(O.OrderID) AS Num
FROM dbo.Orders AS O
	WHERE EXISTS
		(
			SELECT 1 
			FROM dbo.OrderDetails AS OD
			WHERE OD.OrderID = O.OrderID
			HAVING COUNT(OD.OrderID) > 5
		)
GROUP BY O.CustomerID;
GO

SELECT
	YEAR(O.OrderDate) AS OrderYear,
	COUNT(DISTINCT O.CustomerID) AS Num
FROM dbo.Orders AS O
GROUP BY YEAR(O.OrderDate);
GO

SELECT
	Tmp.OrderYear,
	COUNT(DISTINCT Tmp.CustomerID) AS Num
FROM
	(
		SELECT
			YEAR(OrderDate) AS OrderYear,
			CustomerID
		FROM dbo.Orders
	) AS Tmp
GROUP BY Tmp.OrderYear;
GO

USE NikamoozDB;
GO

SELECT
	DT2.OrderYear,
	DT2.Cust_Num
FROM
	(
		SELECT
			DT1.OrderYear,
			COUNT(DISTINCT DT1.CustomerID) AS Cust_Num
		FROM
			(
				SELECT
					YEAR(OrderDate) AS OrderYear,
					CustomerID
				FROM dbo.Orders
			) AS DT1
		GROUP BY OrderYear
	) AS DT2;
GO