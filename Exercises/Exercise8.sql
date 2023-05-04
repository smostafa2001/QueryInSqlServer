USE NikamoozDB;
GO

SELECT
	TOP(1) WITH TIES
	C.CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Customers AS C
INNER JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.[State] = N' Â—«‰'
GROUP BY C.CustomerID
ORDER BY Num;
GO