SELECT
	C.CustomerID,
	C.CompanyName,
	COUNT(DISTINCT O.OrderID) AS NumOrders,
	SUM(OD.Qty) AS TotalQuantity
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
	WHERE C.[State] = N' Â—«‰'
GROUP BY C.CustomerID, C.CompanyName;
GO