USE master;
GO

DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

CREATE TABLE Students
(
	Code INT CONSTRAINT myConst UNIQUE,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	Age INT
);
GO

sp_helpconstraint 'Students';
GO

INSERT INTO Students
	VALUES (1000, N'سمیرا', N'محمودی', 15),
		(1001, N'ترانه', N'جاوید', 14),
		(NULL, N'سحر', N'تقوی', 15);
GO

SELECT * FROM Students;
GO

DROP TABLE IF EXISTS Students;
GO

CREATE TABLE Students
(
	Code INT IDENTITY,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	Age INT,
	CONSTRAINT myConst1 UNIQUE (FirstName, LastName)
);
GO

