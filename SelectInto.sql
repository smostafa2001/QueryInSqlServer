USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Orders1, dbo.Orders2, dbo.Orders3;
GO

SELECT * INTO dbo.Orders1
FROM dbo.Orders;
GO

SELECT
	OrderID, CustomerID AS C_ID
INTO dbo.Orders2
FROM dbo.Orders
	WHERE OrderID > 11076;
GO

SELECT * FROM dbo.Orders2;
GO

SELECT
	OrderID, CustomerID
INTO dbo.Order3
FROM dbo.Orders
	WHERE OrderID > 1000000;
GO

SELECT * FROM dbo.Order3;
GO

DROP TABLE IF EXISTS dbo.Cust_Ord;
GO

SELECT 
	O.CustomerID, C.City, OrderID
INTO dbo.Cust_Ord
FROM dbo.Orders AS O
JOIN dbo.Customers AS C
	ON O.CustomerID = C.CustomerID

SELECT * FROM dbo.Cust_Ord;
GO

DROP TABLE IF EXISTS dbo.Cust_Ord;
GO

SELECT 
	O.CustomerID, C.City, OrderID
FROM dbo.Orders AS O
JOIN dbo.Customers AS C
	ON O.CustomerID = C.CustomerID;
GO

SELECT Tmp.*
INTO dbo.Cust_Ord
FROM
(
	SELECT 
		O.CustomerID, C.City, OrderID
	FROM dbo.Orders AS O
	JOIN dbo.Customers AS C
		ON O.CustomerID = C.CustomerID
) AS Tmp;
GO

SELECT * FROM dbo.Cust_Ord;
GO

SELECT 
	O.CustomerID,
	(
		SELECT C.City
		FROM dbo.Customers AS C
			WHERE C.CustomerID = O.CustomerID
	) AS City,
	OrderID
FROM dbo.Orders AS O;
GO

DROP TABLE IF EXISTS dbo.Cust_Ord;
GO

SELECT Tmp.*
INTO dbo.Cust_Ord
FROM
(
	SELECT 
		O.CustomerID,
		(
			SELECT C.City
			FROM dbo.Customers AS C
				WHERE C.CustomerID = O.CustomerID
		) AS City,
		OrderID
	FROM dbo.Orders AS O
) AS Tmp;
GO