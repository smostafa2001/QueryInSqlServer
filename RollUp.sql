USE NikamoozDB;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	COUNT(OrderID) AS Num
FROM dbo.Orders;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID WITH ROLLUP;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY ROLLUP (CustomerID);
GO

SELECT
	EmployeeID,
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID IN (1, 2)
GROUP BY ROLLUP (EmployeeID, YEAR(OrderDate), MONTH(OrderDate));
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	GROUPING(CustomerID) AS GROUPING_CustomerID
FROM dbo.Orders
GROUP BY ROLLUP (CustomerID);
GO

SELECT
	EmployeeID,
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	COUNT(OrderID) AS Num,
	GROUPING(EmployeeID) AS GROUPING_EmployeeID,
	GROUPING(YEAR(OrderDate)) AS GROUPING_Year,
	GROUPING(MONTH(OrderDate)) AS GROUPING_Month
FROM dbo.Orders
GROUP BY ROLLUP (EmployeeID, YEAR(OrderDate), MONTH(OrderDate));
GO