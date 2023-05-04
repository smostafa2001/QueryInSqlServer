USE NikamoozDB;
GO

SELECT
	OrderID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate DESC;
GO

SELECT
	TOP (5) OrderID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate DESC;
GO

SELECT
	TOP (5) OrderID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate;
GO

SELECT
	TOP (5) PERCENT OrderID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate DESC;
GO

SELECT
	TOP (5) OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders;
GO

SELECT
	TOP (5) WITH TIES OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders
ORDER BY OrderDate DESC;
GO