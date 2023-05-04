USE NikamoozDB;
GO

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num,
	(SELECT MAX(OrderDate) FROM dbo.Orders) AS MaxOrders,
	(SELECT  MIN(OrderDate) FROM dbo.Orders) AS MinOrders
FROM dbo.Orders
GROUP BY EmployeeID;
GO