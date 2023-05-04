DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

DROP TABLE IF EXISTS Employees, JobType;
GO

CREATE TABLE JobType
(
	Code INT IDENTITY,
	Title NVARCHAR(50) PRIMARY KEY
);
GO

INSERT JobType
	VALUES (N'مدیر'), (N'معاون'), (N'سرپرست'),
		(N'کارشناس'), (N'نامشخص');
GO

SELECT * FROM JobType;
GO

DROP TABLE IF EXISTS Employees;
GO

CREATE TABLE Employees
(
	Id INT IDENTITY (0, 100) PRIMARY KEY,
	Family NVARCHAR(100),
	JobTitle NVARCHAR(50) REFERENCES JobType(Title) ON DELETE SET DEFAULT DEFAULT N'نامشخص'
);
GO

INSERT INTO Employees
	VALUES (N'باقری', N'مدیر'),
		(N'سعادت', N'معاون'),
		(N'صدر', N'سرپرست'),
		(N'کریمی', N'سرپرست'),
		(N'صادقی', N'کارشناس'),
		(N'پویا', N'کارشناس')
GO

SELECT * FROM JobType;
GO

DELETE FROM JobType
	WHERE Code = 3;
GO

SELECT * FROM JobType;
SELECT * FROM Employees;
GO