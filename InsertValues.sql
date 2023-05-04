USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Insert_Val1;
GO

CREATE TABLE dbo.Insert_Val1
(
	ID INT,
	Family NVARCHAR(50),
	City NVARCHAR(20),
	DateRegister DATE
);
GO

INSERT INTO dbo.Insert_Val1(ID, Family, City, DateRegister)
	VALUES(1, N'احمدی', N'تهران', '2019-01-01');
GO

DROP TABLE IF EXISTS dbo.Insert_Val1;
GO

CREATE TABLE dbo.Insert_Val1
(
	ID INT NOT NULL,
	Family NVARCHAR(50) NOT NULL,
	City NVARCHAR(20),
	DateRegister DATE DEFAULT GETDATE()
);
GO

INSERT INTO dbo.Insert_Val1
	VALUES(1, N'احمدی', N'تهران', '2019-01-01');
GO

INSERT INTO dbo.Insert_Val1
	VALUES
		(2, N'محمدی', N'شیراز', '2015-02-11'),
		(3, N'اکبری', N'تبریز', GETDATE());
GO

INSERT INTO dbo.Insert_Val1
	VALUES
		(4, N'شادکام', N'اراک', '20150211'),
		(5, N'خسروی', N'ایلام', 'UNKNOWN');
GO

SELECT * FROM dbo.Insert_Val1;
GO

DROP TABLE IF EXISTS dbo.Insert_Val2;

CREATE TABLE dbo.Insert_Val2
(
	ID INT NOT NULL,
	Family NVARCHAR(50) NOT NULL,
	City NVARCHAR(20),
	DateRegister DATE DEFAULT GETDATE()
);
GO

INSERT INTO dbo.Insert_Val2 (ID, Family)
	VALUES(1, N'پرتوی');
GO

INSERT INTO dbo.Insert_Val2
	VALUES (2, N'سعادت', DEFAULT, DEFAULT);
GO

SELECT * FROM dbo.Insert_Val2;
GO

DROP TABLE IF EXISTS dbo.Insert_Val3;
GO

CREATE TABLE dbo.Insert_Val3
(
	ID TINYINT,
	Family NVARCHAR(50),
	City NVARCHAR(10),
	DateRegister DATE
);
GO

INSERT INTO dbo.Insert_Val3
	VALUES(256, N'سعادت', N'بندرعباس', '2019-04-25');
GO

INSERT INTO dbo.Insert_Val3
	VALUES(256, N'سعادت', N'علی آباد کتول', '2019-09-13');
GO

INSERT INTO dbo.Insert_Val3
	VALUES(1, N'سعادت', N'اصفهان', '2019');
GO

SELECT * FROM dbo.Insert_Val3;
GO

DROP TABLE IF EXISTS dbo.Insert_Val4;
GO

CREATE TABLE dbo.Insert_Val4
(
	Code INT,
	ID INT IDENTITY(1, -1),
	Family NVARCHAR(50),
	City NVARCHAR(10),
	DateRegister DATE
);
GO

INSERT INTO dbo.Insert_Val4
	VALUES(1, N'بهمنی', N'اصفهان', GETDATE());
GO

SELECT * FROM dbo.Insert_Val4;
GO

INSERT INTO dbo.Insert_Val4
	VALUES(1, 2, N'بهمنی', N'اصفهان', GETDATE());
GO

SELECT * FROM dbo.Insert_Val4;
GO

SET IDENTITY_INSERT dbo.Insert_VAL4 ON;
GO

INSERT INTO dbo.Insert_Val4(Code, ID, Family, City, DateRegister)
	VALUES(2, 2, N'محمودی', N'شیراز', '20190315');
GO

INSERT INTO dbo.Insert_Val4(Code, ID, Family, City, DateRegister)
	VALUES
		(3, 2, N'فروهر', N'مشهد', '20191021'),
		(4, 100, N'کاویانی', N'تهران', '20191021');
GO

INSERT INTO dbo.Insert_Val4(Code, ID, Family, City, DateRegister)
	VALUES(3, -3, N'صادقی', N'قم', '20191021');
GO

SELECT * FROM dbo.Insert_Val4;
GO

SET IDENTITY_INSERT dbo.Insert_Val4 OFF;
GO

INSERT INTO dbo.Insert_Val4
	VALUES(5, N'جدیدی', N'همدان', '20190215');
GO

SELECT * FROM dbo.Insert_Val4;
GO