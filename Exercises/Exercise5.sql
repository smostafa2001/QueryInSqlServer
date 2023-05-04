SELECT
	C.CustomerID,
	C.CompanyName,
	O.OrderID,
	SUM(OD.Qty) AS Quantity
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
	WHERE C.[State] = N' Â—«‰'
GROUP BY C.CustomerID, 
	C.CompanyName,
	O.OrderID
GO