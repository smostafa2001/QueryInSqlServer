USE NikamoozDB;
GO

SELECT
	C.CustomerID,
	C.[State],
	SUM(OD.Qty) AS Total
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON OD.OrderID = O.OrderID
JOIN dbo.Products AS P
	ON P.ProductID = OD.ProductID
	WHERE C.[State] IN (N' Â—«‰', N'ò—„«‰')
		AND P.ProductName = N'¬» Å— ﬁ«·'
GROUP BY C.CustomerID, C.[State];