USE NikamoozDB;
GO

SELECT
	OrderID, CustomerID, EmployeeID, OrderDate
FROM dbo.Orders;
GO

SELECT
	O.OrderID, O.CustomerID
FROM dbo.Orders AS O;
GO

DROP TABLE IF EXISTS [Order Details];
GO

CREATE TABLE [Order Details]
(
	ID INT
);
GO

SELECT * FROM [Order Details];
GO

DROP TABLE IF EXISTS dbo.[Order Details];
GO

