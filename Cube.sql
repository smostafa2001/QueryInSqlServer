USE NikamoozDB;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CUBE(CustomerID)

SELECT
	EmployeeID,
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CUBE(EmployeeID, YEAR(OrderDate), MONTH(OrderDate))
ORDER BY EmployeeID;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	GROUPING(CustomerID) AS GROUPING_CustomerID
FROM dbo.Orders
GROUP BY CUBE(CustomerID);
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
GROUP BY CUBE(EmployeeID, YEAR(OrderDate), MONTH(OrderDate));
GO