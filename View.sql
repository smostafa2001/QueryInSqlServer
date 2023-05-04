USE NikamoozDB;
GO

SELECT
	C.CompanyName, C.CustomerID,
	COUNT(O.OrderID) AS Num
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName, C.CustomerID;
GO

SELECT
	C.CompanyName, C.City,
	(
		SELECT
			COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C;
GO

SELECT
	C.CompanyName, C.City,
	(
		SELECT
			COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C
	WHERE C.City = N' Â—«‰';
GO

SELECT
	C.CompanyName, C.City,
	(
		SELECT
			COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C
	WHERE C.City = N'«’›Â«‰';
GO

DROP VIEW IF EXISTS dbo.Company_List;
GO

CREATE VIEW dbo.Company_List
AS
(
	SELECT
		C.CompanyName, C.City,
		(
			SELECT COUNT(O.OrderID)
			FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
		) AS Num
	FROM dbo.Customers AS C
);
GO

SELECT * FROM dbo.Company_List;
GO

SELECT * FROM dbo.Company_List AS CL
	WHERE CL.City = N' Â—«‰';
GO

SELECT * FROM dbo.Company_List AS CL
	WHERE CL.City = N'«’›Â«‰';
GO