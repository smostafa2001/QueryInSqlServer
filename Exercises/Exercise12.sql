USE NikamoozDB;
GO

SELECT
	C.CustomerID,
	COUNT(O.OrderID)
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.[State] = N'“‰Ã«‰'
GROUP BY C.CustomerID;
GO