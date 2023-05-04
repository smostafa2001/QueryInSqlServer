USE NikamoozDB;
GO

SELECT
	C.CompanyName,
	C.CustomerID
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName, C.CustomerID
	HAVING COUNT(OrderID) > 10;
GO

SELECT
	C.CompanyName,
	C.CustomerID
FROM dbo.Customers AS C
	WHERE 
		(
			SELECT COUNT(OrderID)
			FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
		) > 10
GO

SELECT
	C.CompanyName,
	C.CustomerID
FROM dbo.Customers AS C
	WHERE C.CustomerID = 
		(
			SELECT O.CustomerID FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
			GROUP BY O.CustomerID
				HAVING COUNT(OrderID) > 10
		);
GO

SELECT
	C.CompanyName,
	C.CustomerID
FROM dbo.Customers AS C
	WHERE EXISTS
		(
			SELECT 1 FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
				HAVING COUNT(O.OrderID) > 10
		);
GO

SELECT
	C.CompanyName,
	C.CustomerID
FROM dbo.Customers AS C
	WHERE C.CustomerID IN
		(
			SELECT O.CustomerID FROM dbo.Orders AS O
			GROUP BY O.CustomerID
				HAVING COUNT(O.OrderID) > 10
		);
GO

--THE RESULT IS INVALID
--SELECT
--	C.CompanyName,
--	(
--		SELECT O.CustomerID
--		FROM dbo.Orders AS O
--			WHERE O.CustomerID = C.CustomerID
--		GROUP BY O.CustomerID
--			HAVING COUNT(O.OrderID) > 10
--	) AS CustomerID
--FROM dbo.Customers AS C;
--GO

SELECT
	(
		SELECT C.CompanyName
		FROM dbo.Customers AS C
			WHERE C.CustomerID = O.CustomerID
	) AS CompanyName, 
	O.CustomerID
FROM dbo.Orders AS O
GROUP BY O.CustomerID
	HAVING COUNT(O.OrderID) > 10
