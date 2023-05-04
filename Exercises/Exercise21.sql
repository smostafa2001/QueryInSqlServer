SELECT
	CustomerID,
	CompanyName,
	(
		SELECT
			MAX(OrderDate)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	)
FROM dbo.Customers AS C;
GO

SELECT
	C.CustomerID,
	C.CompanyName,
	MAX(OrderDate) AS NewOrder
FROM dbo.Orders AS O
RIGHT JOIN dbo.Customers AS C
	ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CompanyName;
GO

SELECT
	C.CustomerID,
	C.CompanyName,
	O1.OrderDate AS NewOrder
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O1
	ON C.CustomerID = O1.CustomerID
	WHERE O1.OrderDate = 
	(
		SELECT
			MAX(O2.OrderDate)
		FROM dbo.Orders AS O2
			WHERE O2.CustomerID = O1.CustomerID
	) OR O1.OrderDate IS NULL
GROUP BY C.CustomerID, C.CompanyName, O1.OrderDate;
GO

SELECT DISTINCT
	C.CustomerID,
	C.CompanyName,
	O1.OrderDate AS NewOrder
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O1
	ON C.CustomerID = O1.CustomerID
	WHERE O1.OrderDate = 
	(
		SELECT
			MAX(O2.OrderDate)
		FROM dbo.Orders AS O2
			WHERE O2.CustomerID = O1.CustomerID
	) OR O1.OrderDate IS NULL;
GO