USE NikamoozDB;
GO

SELECT
	CustomerID, CompanyName
FROM dbo.Customers
	WHERE CustomerID NOT IN
	(
		SELECT
			CustomerID
		FROM dbo.Orders
			WHERE OrderDate = '2016-05-05'
	);
GO

SELECT
	CustomerID, CompanyName
FROM dbo.Customers
	WHERE CustomerID NOT IN
	(
		SELECT 
			CustomerID
		FROM dbo.Orders
			WHERE OrderDate <> '2016-05-05'
	);
GO