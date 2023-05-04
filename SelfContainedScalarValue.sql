USE NikamoozDB;
GO

SELECT
	TOP(1) EmployeeID,
	CustomerID,
	OrderID,
	MAX(OrderDate) AS NewOrders
FROM dbo.Orders
GROUP BY OrderID, OrderDate, EmployeeID, CustomerID
ORDER BY OrderID DESC;
GO

SELECT
	EmployeeID,
	CustomerID,
	OrderID,
	MAX(OrderDate) AS NewOrders
FROM dbo.Orders
GROUP BY OrderID, OrderDate, EmployeeID, CustomerID
ORDER BY OrderID DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
GO

DECLARE @MaxID AS INT = 
	(SELECT MAX(OrderID) FROM dbo.Orders);
SELECT
	EmployeeID, CustomerID, OrderID
FROM dbo.Orders
	WHERE OrderID = @MaxID
GO

SELECT
	EmployeeID, CustomerID, OrderID
FROM dbo.Orders
	WHERE OrderID = 
		(SELECT MAX(OrderID) FROM dbo.Orders);
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	830
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	SUM(COUNT(OrderID))
FROM dbo.Orders
GROUP BY CustomerID;
GO

DECLARE @Num INT = 
	(SELECT COUNT(OrderID) FROM dbo.Orders)
SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	@Num AS Total
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	(SELECT COUNT(OrderID) FROM dbo.Orders) AS Total
FROM dbo.Orders
GROUP BY CustomerID;
GO

SELECT * FROM dbo.Employees
	WHERE LastName LIKE N'Å%';
GO

SELECT
	O.OrderID
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE LastName LIKE N'Å%';
GO

SELECT
	OrderID
FROM dbo.Orders
	WHERE EmployeeID = 
		(
			SELECT EmployeeID 
			FROM dbo.Employees 
				WHERE LastName LIKE N'Å%'
		);
GO

SELECT * FROM dbo.Employees
	WHERE LastName LIKE N' %';
GO

SELECT
	OrderID
FROM dbo.Orders
	WHERE EmployeeID = 
	(
		SELECT EmployeeID
		FROM dbo.Employees
			WHERE LastName LIKE N' %'
	);
GO