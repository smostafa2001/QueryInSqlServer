USE NikamoozDB;
GO

SELECT * FROM dbo.Orders
	WHERE EXISTS
	(
		SELECT 1
		FROM dbo.Customers
		WHERE City = N'تهران'
	);
GO

SELECT * FROM dbo.Orders
	WHERE EXISTS
		(
			SELECT 1 FROM dbo.Customers
				WHERE City = N'بیرجند'
		);
GO

SELECT *
FROM dbo.Orders
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Customers
				WHERE City = N'کرج'
		);
GO

SELECT *
FROM dbo.Orders
	WHERE NOT EXISTS
		(
			SELECT 1
			FROM dbo.Customers
				WHERE City = N'کرج'
		);
GO

SELECT *
FROM dbo.Customers AS C
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
		);
GO

SELECT *
FROM dbo.Customers AS C
	WHERE NOT EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
		);
GO

SELECT * FROM dbo.Customers
	WHERE EXISTS
		(
			SELECT REGION FROM dbo.Customers
				WHERE Region IS NULL
		);
GO

SELECT * FROM dbo.Customers
	WHERE NOT EXISTS
		(
			SELECT REGION FROM dbo.Customers
				WHERE Region IS NULL
		);
GO