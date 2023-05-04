USE NikamoozDB;
GO

/*
https://technet.microsoft.com/en-us/library/ms190309(v=sql.110).aspx
https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver16
*/
DECLARE @X INT = 2.7;
SELECT @X;
GO

SELECT * FROM DBO.Orders
	WHERE OrderDate = '20160506'; --IMLICIT CONVERSION
GO

DECLARE @d DATE = '20160506';
SELECT * FROM dbo.Orders
	WHERE OrderDate = @d;
GO

SELECT GETDATE();
GO

SELECT
	OrderID,
	YEAR(OrderDate) AS N'سال',
	MONTH(OrderDate) AS N'ماه',
	DAY(OrderDate) AS N'روز'
FROM DBO.Orders;
GO

SELECT
	DATENAME(YEAR, '20170915') AS N'سال میلادی',
	DATENAME(MONTH, '20170915') AS N'ماه میلادی',
	DATENAME(DAY, '20170915') AS N'چندمین روز از ماه',
	DATENAME(DAYOFYEAR, '20170915') AS N'چندمین روز از سال',
	DATENAME(WEEKDAY, '20170915') AS N'عنوان روز هفته';
GO

SELECT
	DATEPART(YEAR, '20170915') AS N'سال میلادی',
	DATEPART(MONTH, '20170915') AS N'ماه میلادی',
	DATEPART(DAY, '20170915') AS N'چندمین روز از ماه',
	DATEPART(DAYOFYEAR, '20170915') AS N'چندمین روز از سال',
	DATEPART(WEEKDAY, '20170915') AS N'عنوان روز هفته';
GO

DECLARE @X DATE = '2019'
SELECT

	DATENAME(YEAR, @X) AS N'سال میلادی',
	DATENAME(MONTH, @X) AS N'ماه میلادی',
	DATENAME(DAY, @X) AS N'چندمین روز از ماه',
	DATENAME(DAYOFYEAR, @X) AS N'چندمین روز از سال',
	DATENAME(WEEKDAY, @X) AS N'عنوان روز هفته';
GO

SELECT
	DATEADD(YEAR, 1, '2017-09-15') AS N'افزایش سال',
	DATEADD(YEAR, -1, '2017-09-15') AS N'کاهش سال',
	DATEADD(MONTH, 1, '2017-09-15') AS N'افزایش ماه',
	DATEADD(MONTH, -1, '2017-09-15') AS N'کاهش ماه',
	DATEADD(DAY, 1, '2017-09-15') AS N'افزایش روز',
	DATEADD(DAY, -1, '2017-09-15') AS N'کاهش روز';
GO

SELECT DATEDIFF(DAY, '20130512', GETDATE());
GO

SELECT DATEDIFF(DAY, GETDATE(), '20130512');
GO

SELECT DATEDIFF_BIG(SECOND, '19140628', GETDATE());
GO

SELECT ISDATE('20140212');
SELECT ISDATE('2000212');
SELECT ISDATE('20140231');
GO 