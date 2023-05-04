SELECT
	TOP(1) WITH TIES City,
	COUNT(O.OrderID) AS Num
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
GROUP BY City
ORDER BY Num;
GO