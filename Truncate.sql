﻿USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.TRUNCATE_Tbl, dbo.TRUNCATE_CT, dbo.TRUNCATE_PT;

CREATE TABLE dbo.TRUNCATE_Tbl
(
	ID INT IDENTITY,
	Code VARCHAR(10),
	City NVARCHAR(20)
);
GO

INSERT INTO dbo.TRUNCATE_Tbl
	VALUES
		('CD-01', N'تهران'), ('CD-02', N'تهران'), ('CD-03', N'تهران'),
		('CD-04', N'اصفهان'), ('CD-05', N'مشهد'), ('CD-06', N'تبریز'),
		('CD-07', N'شیراز'), ('CD-08', N'تبریز'), ('CD-09', N'مشهد')
GO

TRUNCATE TABLE dbo.TRUNCATE_Tbl;
GO

INSERT INTO dbo.TRUNCATE_Tbl
	VALUES
		('CD-01', N'تهران'), ('CD-02', N'تهران'), ('CD-03', N'تهران'),
		('CD-04', N'اصفهان'), ('CD-05', N'مشهد'), ('CD-06', N'تبریز'),
		('CD-07', N'شیراز'), ('CD-08', N'تبریز'), ('CD-09', N'مشهد')
GO

SELECT * FROM dbo.TRUNCATE_Tbl;
GO

DROP TABLE IF EXISTS dbo.TRUNCATE_PT;
GO

CREATE TABLE dbo.TRUNCATE_PT
(
	ID INT IDENTITY PRIMARY KEY,
	Code VARCHAR(10),
	City NVARCHAR(20)
);
GO

INSERT INTO dbo.TRUNCATE_PT
	VALUES
		('CD-01', N'تهران'), ('CD-02', N'تهران'), ('CD-03', N'تهران'),
		('CD-04', N'اصفهان'), ('CD-05', N'مشهد'), ('CD-06', N'تبریز'),
		('CD-07', N'شیراز'), ('CD-08', N'تبریز'), ('CD-09', N'مشهد');
GO

DROP TABLE IF EXISTS dbo.TRUNCATE_CT;
GO

CREATE TABLE dbo.TRUNCATE_CT
(
	ID INT REFERENCES dbo.TRUNCATE_PT(ID),
	OrderID INT
);
GO


INSERT INTO dbo.TRUNCATE_CT
	VALUES
		(1, 1001), (1, 1002),(1, 1003), (2, 1004),(2, 1005), (2, 1006),
		(3, 1007), (3, 1008),(3, 1009), (4, 1010),(4, 1011), (4, 1012),
		(5, 1013), (6, 1014),(7, 1015), (8, 1016),(9, 1017), (9, 1018);
GO

TRUNCATE TABLE dbo.TRUNCATE_PT;
GO

TRUNCATE TABLE dbo.TRUNCATE_CT;
GO

TRUNCATE TABLE dbo.TRUNCATE_PT;
GO