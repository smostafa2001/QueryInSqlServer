USE NikamoozDB;
GO

SELECT
	CompanyName, CustomerID
FROM dbo.Customers
	WHERE CustomerID NOT IN
	(
		SELECT DISTINCT
			CustomerID
		FROM dbo.Orders
			WHERE OrderID % 2 = 0
	);
GO

SELECT
	DISTINCT C.CompanyName, C.CustomerID
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.CustomerID NOT IN
	(
		SELECT
			CustomerID
		FROM dbo.Orders
			WHERE OrderID % 2 = 0
	);
GO