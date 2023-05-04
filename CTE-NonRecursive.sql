USE NikamoozDB;
GO

SELECT
	TC.CompanyName
FROM
	(
		SELECT
			C.CustomerID, C.CompanyName
		FROM dbo.Customers AS C
			WHERE C.City = N' Â—«‰'
	) AS TC;
GO

SELECT
	TC.CompanyName
FROM
	(
		SELECT
			C.CustomerID, C.CompanyName
		FROM dbo.Customers AS C
			WHERE C.City = N' Â—«‰'
	) AS TC
JOIN
	(
		SELECT
			C.CustomerID, C.CompanyName
		FROM dbo.Customers AS C
			WHERE C.City = N' Â—«‰'
	) AS TC1
	ON TC.CustomerID = TC1.CustomerID
GO

WITH TehranCustomers
AS
(
	SELECT
		CustomerID, CompanyName
	FROM dbo.Customers
		WHERE [State] = N' Â—«‰'
)
SELECT TC.CompanyName, TC.CustomerID FROM TehranCustomers AS TC;
GO

WITH TehranCustomers
AS
(
	SELECT
		CustomerID, CompanyName
	FROM dbo.Customers
		WHERE [State] = N' Â—«‰'
)
SELECT
	TC1.CompanyName, TC1.CustomerID
FROM TehranCustomers AS TC1
JOIN TehranCustomers AS TC2
	ON TC1.CustomerID = TC2.CustomerID;
GO