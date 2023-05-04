USE NikamoozDB;
GO

DROP VIEW IF EXISTS dbo.ViewBinding;
GO

DROP TABLE IF EXISTS dbo.SchemaBindingTbl;

CREATE TABLE dbo.SchemaBindingTbl
(
	ID INT,
	Family NVARCHAR(50)
);
GO

INSERT INTO dbo.SchemaBindingTbl
	VALUES
		(100, N'سعیدی'),
		(200, N'کاردان'),
		(300, N'شاکری');
GO

DROP VIEW IF EXISTS dbo.ViewBinding;
GO

CREATE VIEW ViewBinding
AS
	SELECT ID, Family
	FROM SchemaBindingTbl;
GO

SELECT * FROM dbo.ViewBinding;
GO

ALTER TABLE SchemaBindingTbl
	ALTER COLUMN Family NVARCHAR(100);
GO

ALTER VIEW ViewBinding WITH SCHEMABINDING
AS
	SELECT ID, Family
	FROM dbo.SchemaBindingTbl;
GO

ALTER TABLE SchemaBindingTbl
	ALTER COLUMN Family NVARCHAR(80);
GO

ALTER VIEW ViewBinding WITH SCHEMABINDING
AS
	SELECT ID FROM dbo.SchemaBindingTbl;
GO

SELECT * FROM ViewBinding;
GO

ALTER TABLE SchemaBindingTbl
	ALTER COLUMN Family NVARCHAR(80);
GO