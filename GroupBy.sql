USE NikamoozDB;
GO

SELECT
	DISTINCT EmployeeID, CustomerID
FROM dbo.Orders;
GO

SELECT
	EmployeeID, CustomerID
FROM dbo.Orders
GROUP BY EmployeeID, CustomerID;
GO

SELECT
	EmployeeID, CustomerID
FROM dbo.Orders
GROUP BY EmployeeID;
GO

SELECT
	EmployeeID
FROM dbo.Orders
GROUP BY EmployeeID, CustomerID;
GO

SELECT
	EmployeeID, CustomerID
FROM dbo.Orders
GROUP BY EmployeeID, CustomerID, OrderID
ORDER BY OrderID;
GO