USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Customers1;

SELECT * INTO dbo.Customers1
FROM dbo.Customers;
GO

SELECT * FROM dbo.Customers1;
GO

UPDATE dbo.Customers1
	SET CompanyName = CompanyName + '*';
GO

SELECT * FROM dbo.Customers1;
GO

UPDATE dbo.Customers1
	SET CompanyName = REPLACE(CompanyName, '*', '');
GO

SELECT * FROM dbo.Customers1;
GO

UPDATE dbo.Customers1
	SET Region = N'مرکزی'
		WHERE Region = N'مرکز';
GO

SELECT * FROM dbo.Customers1;
GO

UPDATE dbo.Customers1
	SET 
		CITY = N'فاقد شهر',
		Region = N'فاقد شهر';
GO

SELECT * FROM dbo.Customers1;
GO

SELECT * FROM dbo.Customers1 AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID;
GO

UPDATE C
	SET CompanyName = CompanyName + '+'
FROM dbo.Customers1 AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID;
GO

SELECT * FROM dbo.Customers1;
GO

UPDATE C
	SET CompanyName = CompanyName + '+'
FROM dbo.Customers1 AS C
	WHERE EXISTS
	(
		SELECT 1
		FROM Orders AS O
			WHERE C.CustomerID = O.CustomerID
	);
GO

DROP TABLE IF EXISTS dbo.UPDATE_Test;
GO

CREATE TABLE dbo.UPDATE_Test
(
	Col1 INT,
	Col2 INT
);
GO

INSERT INTO dbo.UPDATE_Test
	VALUES(1, 100);
GO

SELECT * FROM dbo.UPDATE_Test;
GO

UPDATE dbo.UPDATE_Test
	SET 
		Col1 = Col1 + 10,
		Col2 = Col1 + 10;
GO

DELETE FROM dbo.UPDATE_Test;
GO

INSERT INTO dbo.UPDATE_Test
	VALUES(1, 100);
GO

SELECT * FROM dbo.UPDATE_Test;
GO

UPDATE dbo.UPDATE_Test
	SET 
		Col1 = Col2,
		Col2 = Col1;
GO

SELECT * FROM dbo.UPDATE_Test;
GO