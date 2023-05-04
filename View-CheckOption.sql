USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Company;
GO

CREATE TABLE dbo.Company
(
	CompanyID INT IDENTITY,
	CompanyName NVARCHAR(50),
	City NVARCHAR(30)
);
GO

INSERT INTO dbo.Company
	VALUES
	(N'شرکت ۱', N'تهران'),
	(N'شرکت ۲', N'تهران'),
	(N'شرکت ۳', N'اصفهان'),
	(N'شرکت ۴', N'تبریز'),
	(N'شرکت ۵', N'تهران'),
	(N'شرکت ۶', N'شیراز');
GO

DROP VIEW IF EXISTS dbo.Comp_View;
GO

CREATE VIEW dbo.Comp_View
AS
(
	SELECT
		CompanyName, City
	FROM dbo.Company
		WHERE City = N'تهران'
);
GO

SELECT * FROM dbo.Comp_View;
GO

INSERT dbo.Comp_View (CompanyName, City)
	VALUES (N'شرکت ۷', N'رشت');
GO

SELECT * FROM dbo.Company;
GO

ALTER VIEW dbo.Comp_View
AS
(
	SELECT
		City, CompanyName
	FROM dbo.Company
		WHERE City = N'تهران'
) WITH CHECK OPTION;
GO

INSERT INTO dbo.Comp_View (CompanyName, City)
	VALUES (N'شرکت ۸', N'ساری');
GO

INSERT INTO dbo.Comp_View (CompanyName, City)
	VALUES (N'شرکت ۸', N'تهران');
GO

SELECT * FROM dbo.Company;
SELECT * FROM dbo.Comp_View;
GO

ALTER VIEW dbo.Comp_View
AS
(
	SELECT City
	FROM dbo.Company
		WHERE City = N'تهران'
	GROUP BY City
) WITH CHECK OPTION;
GO

SELECT * FROM dbo.Comp_View;

INSERT INTO dbo.Comp_View (City)
	VALUES (N'تهران');
GO

ALTER VIEW dbo.Comp_View
AS
(
	SELECT DISTINCT City
	FROM dbo.Company
		WHERE City = N'تهران'
) WITH CHECK OPTION;
GO

SELECT * FROM dbo.Comp_View;

INSERT INTO dbo.Comp_View (City)
	VALUES (N'تهران');
GO

ALTER VIEW dbo.Comp_View
AS
(
	SELECT N'نام شهر' AS City, N'عنوان شرکت' AS CompanyName
	UNION
	SELECT
		CompanyName, City
	FROM dbo.Company
		WHERE City = N'تهران'
) WITH CHECK OPTION;
GO

SELECT * FROM dbo.Comp_View;

INSERT INTO dbo.Comp_View (City)
	VALUES (N'تهران');
GO
