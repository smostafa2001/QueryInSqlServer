USE NikamoozDB;
GO

SELECT
	C.CustomerID
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.[State] IS NULL
	AND O.OrderID IS NULL;
GO