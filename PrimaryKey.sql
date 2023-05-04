USE master;
GO

DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

DROP TABLE IF EXISTS Students;
GO

CREATE TABLE Students
(
	Code INT CONSTRAINT myConst1 PRIMARY KEY,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	Age INT
);
GO

sp_helpconstraint 'Students';
GO

INSERT INTO Students
	VALUES (1000, N'سمیرا',N'محمودی', 15),
		(1001, N'ترانه', N'جاوید',14);
GO

SELECT * FROM Students;
GO

INSERT INTO Students
	VALUES (100, N'شبنم', N'پرتوی', 12);
GO

DROP TABLE IF EXISTS Students;
GO

CREATE TABLE Students
(
	Code INT IDENTITY,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	Age INT,
	CONSTRAINT myConst1 PRIMARY KEY(FirstName, LastName)
);
GO

INSERT INTO Students
	VALUES (N'سمیرا', N'محمودی', 15),
		(N'ترانه', N'جاوید', 14);
GO

SELECT * FROM Students;
GO

INSERT INTO Students
	VALUES (N'سمیرا', N'احمدی', 12);
GO

SELECT * FROM Students;
GO

