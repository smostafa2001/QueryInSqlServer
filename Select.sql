USE NikamoozDB;
GO

SELECT N'علی';
SELECT 1, 5*4, 'Test', N'جواد';
GO

SELECT * FROM dbo.Orders;
GO

SELECT
	[OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [Freight]
FROM dbo.Orders;
GO

SELECT
	OrderID, OrderDate
FROM dbo.Orders;
GO

SELECT
	EmployeeID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders;
GO

SELECT
	EmployeeID, OrderYear = YEAR(OrderDate)
FROM dbo.Orders;
GO

SELECT
	OrderID, YEAR(OrderDate) AS OD
FROM dbo.Orders
	WHERE YEAR(OrderDate) > 2015; --WHERE OD > 2015 IS WRONG CUZ WHERE EXCECUTES FIRST...
GO

SELECT
	OrderDate, YEAR(OrderDate) AS OD
FROM DBO.Orders
	WHERE OrderDate > 2015;
GO

SELECT
	OrderDate, YEAR(OrderDate) AS OD
FROM DBO.Orders
	WHERE OrderDate > '20160101';
GO