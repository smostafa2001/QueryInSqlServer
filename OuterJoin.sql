USE NikamoozDB;
GO

SELECT
	C.CustomerID, C.CompanyName, O.OrderID
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID;
GO

SELECT
	C.CustomerID, C.CompanyName, O.OrderID
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID;
GO

SELECT
	C.CustomerID, CompanyName
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE O.OrderID IS NULL;
GO

SELECT
	C.CustomerID, C.CompanyName, O.OrderID
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	AND O.OrderID IS NULL;
GO

SELECT
	E.FirstName, E.LastName, O.CustomerID
FROM dbo.Employees AS E
CROSS JOIN dbo.Orders AS O;
GO

SELECT
	E.FirstName, E.LastName, O.CustomerID
FROM dbo.Orders AS O
CROSS JOIN dbo.Employees AS E;
GO

SELECT
	C.CompanyName, O.OrderID
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID;
GO

SELECT
	C.CompanyName, O.OrderID
FROM  dbo.Orders AS O
JOIN dbo.Customers AS C
	ON C.CustomerID = O.CustomerID;
GO

SELECT
	C.CompanyName, O.OrderID
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID;
GO

SELECT
	C.CompanyName, O.OrderID
FROM dbo.Orders AS O
LEFT JOIN dbo.Customers AS C
	ON C.CustomerID = O.CustomerID;
GO

USE AdventureWorks2017;
GO

SELECT * FROM Person.Person AS P
JOIN Person.PersonPhone AS PP
	ON P.BusinessEntityID = PP.BusinessEntityID
JOIN SALES.SalesPerson AS SP
	ON SP.BusinessEntityID = P.BusinessEntityID;
GO

SELECT * FROM Person.Person AS P
JOIN Person.PersonPhone AS PP
	ON P.BusinessEntityID = PP.BusinessEntityID
JOIN SALES.SalesPerson AS SP
	ON SP.BusinessEntityID = P.BusinessEntityID
OPTION(FORCE ORDER);
GO

USE NikamoozDB;
GO

SELECT
	C.CustomerID,
	O.OrderID,
	OD.ProductID, OD.Qty
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
ORDER BY C.CustomerID;
GO

SELECT
	C.CustomerID,
	O.OrderID,
	OD.ProductID, OD.Qty
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
ORDER BY C.CustomerID;
GO

SELECT
	C.CustomerID,
	O.OrderID,
	OD.ProductID,
	OD.Qty
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
LEFT JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
GO

SELECT
	C.CustomerID,
	O.OrderID,
	OD.ProductID,
	OD.Qty
FROM dbo.Orders AS O
JOIN DBO.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
RIGHT JOIN DBO.Customers AS C
	ON O.CustomerID = C.CustomerID;
GO

SELECT
	C.CustomerID,
	O.OrderID,
	OD.ProductID,
	OD.Qty
FROM dbo.Customers AS C
LEFT JOIN
	(
		dbo.Orders AS O
		JOIN dbo.OrderDetails AS OD
		ON O.OrderID = OD.OrderID
	) ON C.CustomerID = O.CustomerID;
GO

SELECT
	C.CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID
ORDER BY C.CustomerID;
GO

DROP TABLE IF EXISTS dbo.Personnel, dbo.PersonnelType
GO

CREATE TABLE dbo.Personnel
(
	ID INT IDENTITY,
	Family NVARCHAR(50),
	[Type] NVARCHAR(20)
);
GO

CREATE TABLE dbo.PersonnelType
(
	ID INT IDENTITY,
	Title NVARCHAR(20)
);
GO

INSERT INTO dbo.Personnel
	VALUES
		(N'احمدی', N'مدیرعامل'),
		(N'تقوی', N'سرپرست'),
		(N'نامشخص', N'مدیر'),
		(N'جعفری', N'نامشخص');
GO

INSERT INTO dbo.PersonnelType
	VALUES
		(N'مدیرعامل'),
		(N'مدیر'),
		(N'سرپرست'),
		(N'کارشناس'),
		(N'تکنسین');
GO

SELECT
	P.Family, PT.Title
FROM dbo.Personnel AS P
FULL OUTER JOIN dbo.PersonnelType AS PT
	ON P.[Type] = PT.Title;
GO

DROP TABLE IF EXISTS J1, J2;

CREATE TABLE J1(ID INT);
GO

CREATE TABLE J2
(
	ID INT,
	Title VARCHAR(10)
);
GO

INSERT J1 VALUES (1), (2), (NULL), (NULL);
GO

INSERT J2 VALUES (1, 'One'), (2, 'Two'), (NULL, 'Three');
GO

SELECT * FROM J1;
SELECT * FROM J2;
GO

SELECT J1.ID, J2.Title
FROM J1
CROSS JOIN J2;
GO

SELECT J1.ID, J2.Title
FROM J1
INNER JOIN J2 ON J1.ID = J2.ID;
GO

SELECT
	J1.ID, J2.Title
FROM J1
LEFT OUTER JOIN J2
	ON J1.ID = J2.ID;
GO