SELECT
	TOP(3) WITH TIES P.ProductName,
	SUM(OD.Qty) AS Total
FROM dbo.Products AS P
JOIN dbo.OrderDetails AS OD
	ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Total DESC;
GO