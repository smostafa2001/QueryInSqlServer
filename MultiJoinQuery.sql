USE NikamoozDB;
GO

SELECT
	C.CompanyName,
	O.OrderID,
	OD.ProductID,
	OD.Qty
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
GO