USE master;
GO

DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

DROP TABLE IF EXISTS Employees;
GO

CREATE TABLE Employees
(
	Id INT CONSTRAINT myConst10 CHECK (Id>=100),
	Country NVARCHAR(100) CONSTRAINT myConst20 CHECK (Country In (N'ایتالیا',N'ایران',N'آمریکا')),
	Barcode VARCHAR(100) CHECK (Barcode LIKE ('[0-9][a-h]/%'))
);
GO

sp_helpconstraint 'Employees';
GO

INSERT INTO Employees
VALUES(100,N'آمریکا','0a/'),(101,N'ایران','1e/ir'),(102,N'ایتالیا','8H/10')
GO

SELECT * FROM Employees;
GO

ALTER TABLE Employees
ADD COL1 INT DEFAULT -1 WITH VALUES;
GO

SELECT * FROM Employees;
GO

ALTER TABLE Employees
	WITH NOCHECK
		ADD CHECK (Col1 > 1000);
GO

SELECT * FROM Employees;
GO

