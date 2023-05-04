IF db_id ('Test01')>0
BEGIN
	DROP DATABASE test01;
END
GO

DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

SELECT * FROM sys.sysfiles;
GO

EXEC sp_helpfile;
GO

USE master;

DROP DATABASE IF EXISTS Test01;
GO

CREATE DATABASE Test01
	ON
	(NAME = naDB1, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Data1.ndf', SIZE = 10MB, MAXSIZE = 100, FILEGROWTH = 20MB),
	(NAME = naDB2, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Data2.ndf', SIZE = 15MB, MAXSIZE = 100, FILEGROWTH = 20%),
	(NAME = naDB3, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Data3.ndf', SIZE = 10MB, MAXSIZE = UNLIMITED, FILEGROWTH = 20)
LOG ON
	(NAME = naL1, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Log1.ldf', SIZE = 100MB, MAXSIZE = 100, FILEGROWTH = 20),
	(NAME = naL2, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Log2.ldf', SIZE = 50MB, MAXSIZE = 100, FILEGROWTH = 20);
GO
--Access Denied


ALTER DATABASE Test01
	ADD FILE(NAME = naDB1, FILENAME = 'C:\Users\Mostafa\Desktop\DatabaseExercises\TempDb\Test01Data1.ndf', SIZE = 10MB, MAXSIZE = 100, FILEGROWTH = 20MB);
GO

USE Test01;
GO

DROP TABLE IF EXISTS UserTable;
GO

CREATE TABLE UserTable
(
	Code INT NOT NULL,
	Family NVARCHAR(100) NULL
);
GO

EXEC sp_help 'USERTABLE';
GO

INSERT INTO UserTable (Code, Family)
	VALUES (1, N'صابری'), (2, N'شمس');
GO

SELECT * FROM UserTable;
GO

DROP TABLE IF EXISTS Users;
GO

CREATE TABLE Users
(
	Family VARCHAR(10)
);
GO

SELECT * FROM Users;

ALTER TABLE Users
	ALTER COLUMN Family NVARCHAR(10);
GO

INSERT INTO Users (Family)
	VALUES (N'سلامت'),(N'مجیدی'),(N'قبادی')
GO

DROP TABLE IF EXISTS IdentityUsers;
GO

CREATE TABLE IdentityUsers
(
	Id INT IDENTITY(1, 1), -- SEED, INCREMENT
	Family NVARCHAR(50)
);
GO


INSERT INTO IdentityUsers (Family)
	VALUES (N'راد'), (N'طلایی'),(N'اخوان'),(N'سرافراز'),(N'سعیدی'),(N'پرتوی');
GO

ALTER TABLE IdentityUsers
	ADD Country NVARCHAR(50) NULL,
		City NVARCHAR(50) NULL;
GO

SELECT * FROM IdentityUsers;
GO