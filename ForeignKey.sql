DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

DROP TABLE IF EXISTS Orders, Customers;
GO

CREATE TABLE Customers
(
	Id INT PRIMARY KEY,
	CompanyName NVARCHAR(100)
);
GO

EXEC sp_helpconstraint 'Customers';
GO

INSERT INTO Customers
	VALUES (100, N'تهران گستر'),
		(101, N'ایران گستر'),
		(102, N'ایرانیان');
GO

SELECT * FROM Customers;
GO

DROP TABLE IF EXISTS Orders;
GO

CREATE TABLE Orders
(
	Id INT REFERENCES Customers(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	OrderDate CHAR(10)
);
GO

INSERT INTO Orders
	VALUES (100, '1395.03.25'),
		(101, '1395.03.29'), (101, '1395.04.01'),
		(102, '1395.04.02'), (102, '1395.04.03'), (102, '1395.04.11');
GO

SELECT * FROM Customers;
SELECT * FROM Orders;
GO

INSERT INTO Customers
	VALUES (103, N'نیک آموز');
GO

INSERT INTO Orders
	VALUES (104, '1395.04.22');
GO

DELETE FROM Customers
	WHERE Id = 100;
GO

SELECT * FROM Customers;
SELECT * FROM Orders;
GO

DELETE FROM Orders
	WHERE ID = 101;
GO

UPDATE Customers
	SET Id = 1000
		WHERE Id = 102;
GO

UPDATE Orders
	SET ID = 2000
		WHERE ID = 1000;
GO

DROP TABLE IF EXISTS ParentTbl;
GO

CREATE TABLE ParentTbl
(
	Col1 INT,
	Col2 INT,
	PRIMARY KEY (Col1, Col2)
);
GO

INSERT INTO ParentTbl
	VALUES (1, 1), (1, 2),
		(2, 1), (2, 2);
GO

SELECT * FROM ParentTbl;
GO

DROP TABLE IF EXISTS ChildTbl;
GO

CREATE TABLE ChildTbl
(
	Fld1 INT,
	Fld2 INT,
	Title VARCHAR(10)
	FOREIGN KEY(Fld1, Fld2) REFERENCES ParentTbl(Col1, Col2)
);
GO