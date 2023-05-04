SELECT
	C.CustomerID, C.CompanyName,
	O.OrderID,
	OD.ProductID,
	OD.Qty
FROM Customers AS C
LEFT JOIN Orders AS O
	ON C.CustomerID = O.CustomerID
LEFT JOIN OrderDetails AS OD
	ON O.OrderID = OD.OrderID
ORDER BY C.CustomerID