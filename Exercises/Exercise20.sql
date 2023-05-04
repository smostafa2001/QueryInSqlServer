SELECT
	C.CustomerID, C.CompanyName,
	(
		SELECT
			COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
	) AS Num
FROM dbo.Customers AS C;
GO

SELECT
	C.CustomerID, C.CompanyName,
	COUNT(OrderID) AS Num
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CompanyName;
GO

--THE RESULT IS INVALID!
SELECT
	CustomerID,
	(	
		SELECT
			C.CompanyName
		FROM dbo.Customers AS C
		WHERE O.CustomerID = C.CustomerID
	) AS Num,
	COUNT(OrderID)
FROM dbo.Orders AS O
GROUP BY O.CustomerID;
GO