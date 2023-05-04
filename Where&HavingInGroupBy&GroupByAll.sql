USE NikamoozDB;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID <> 9
GROUP BY EmployeeID;
GO

--SELECT
--	CustomerID,
--	COUNT(OrderID) AS Num
--FROM dbo.Orders
--	WHERE Num > 20
--GROUP BY CustomerID;
--GO

--SELECT
--	CustomerID,
--	COUNT(OrderID) AS Num
--FROM dbo.Orders
--	WHERE COUNT(OrderID) > 20
--GROUP BY CustomerID;
--GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID
	HAVING COUNT(OrderID) > 20;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID <> 8
GROUP BY EmployeeID
	HAVING COUNT(OrderID) > 70;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID < 50
GROUP BY EmployeeID;
GO

SELECT
	EmployeeID,
	CustomerID
FROM dbo.Orders
GROUP BY EmployeeID, CustomerID
	HAVING COUNT(OrderID) > 5;
GO

SELECT
	C.City,
	COUNT(C.City) AS Num
FROM dbo.Customers AS C
GROUP BY C.City;
GO

SELECT
	COUNT(City)
FROM dbo.Customers
	WHERE City IN (N'تهران', N'اصفهان');
GO

SELECT
	COUNT(*)
FROM dbo.Customers

SELECT
	COUNT(C.City) AS Num
FROM dbo.Customers AS C
	WHERE C.[State] IN (N'یزد', N'کرمان'); 
GO

SELECT
	C.CustomerID
FROM dbo.Customers AS C
GROUP BY C.CustomerID
	HAVING COUNT(C.[State]) > 0;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID BETWEEN 1 AND 3
GROUP BY ALL EmployeeID
ORDER BY EmployeeID;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID BETWEEN 1 AND 3
GROUP BY ALL EmployeeID
	HAVING COUNT(OrderID) > 100
ORDER BY EmployeeID;
GO