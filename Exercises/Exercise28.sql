USE NikamoozDB;
GO

SELECT
	C.CustomerID, C.CompanyName
FROM dbo.Customers AS C
	WHERE EXISTS
		(
			SELECT 1 FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
			AND YEAR(O.OrderDate) = 2015
		)
EXCEPT
SELECT
	C.CompanyName, C.CustomerID
FROM DBO.Customers AS C
	WHERE EXISTS
		(
			SELECT 1 FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
			AND YEAR(O.OrderDate) = 2016
		);
GO

SELECT
	C.CustomerID,
	C.CompanyName
FROM dbo.Customers AS C
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
				AND YEAR(O.OrderDate)=2015
		)
	AND NOT EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
				AND YEAR(O.OrderDate)=2016
		);
GO

SELECT
	C.CustomerID,
	C.CompanyName
FROM dbo.Customers AS C
	WHERE C.CustomerID IN
		(
			SELECT O.CustomerID
			FROM dbo.Orders AS O
				WHERE YEAR(O.OrderDate)=2015
		)
		AND C.CustomerID NOT IN
		(
			SELECT O.CustomerID
			FROM dbo.Orders AS O
				WHERE YEAR(O.OrderDate)=2016
		);
GO

SELECT
	C.CustomerID,
	C.CompanyName
FROM dbo.Customers AS C
	WHERE C.CustomerID IN
		(
			SELECT O.CustomerID
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
				AND YEAR(O.OrderDate)=2015
		)
		AND C.CustomerID NOT IN
		(
			SELECT O.CustomerID
			FROM dbo.Orders AS O
				WHERE C.CustomerID = O.CustomerID
				AND YEAR(O.OrderDate)=2016
		);
GO