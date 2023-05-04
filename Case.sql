SELECT
	CustomerID,
	CASE
		WHEN Region IS NULL THEN N'فاقد موقعیت'
		-- WHEN Region ... THEN ...
		ELSE Region
	END AS Case_Value
FROM dbo.Customers;
GO

USE NikamoozDB;
GO

SELECT
	ProductID, ProductName, CategoryID
FROM dbo.Products;
GO

--SIMPLE CASE
SELECT
	ProductID, ProductName, CategoryID,
	CASE CategoryID
		WHEN 1 THEN N'نوشیدنی'
		WHEN 2 THEN N'ادویه‌جات'
		WHEN 3 THEN N'مرباجات'
		WHEN 4 THEN N'محصولات لبنی'
		WHEN 5 THEN N'حبوبات'
		WHEN 6 THEN N'گوشت و مرغ'
		WHEN 7 THEN N'ارگانیک'
		WHEN 8 THEN N'دریایی'
		ELSE N'متفرقه'
	END AS CategoryName
FROM dbo.Products
ORDER BY CategoryName;
GO

SELECT
	ProductID, UnitPrice
FROM dbo.OrderDetails;
GO

--SEARCHED CASE
SELECT
	ProductID, UnitPrice,
	CASE
		WHEN UnitPrice < 50 THEN N'کمتر از ۵۰'
		WHEN UnitPrice BETWEEN 50 AND 100 THEN N'بین ۵۰ تا ۱۰۰'
		WHEN UnitPrice > 100 THEN N'بیشتر از ۱۰۰'
		ELSE N'نامشخص'
	END AS UnitPriceCategory
FROM dbo.OrderDetails
ORDER BY UnitPrice;
GO

SELECT
	City,
	CASE City
		WHEN N'تهران' THEN N'پایتخت'
	END AS N'نوع شهر'
FROM dbo.Customers;
GO

SELECT
	CustomerID, Region
FROM dbo.Customers
ORDER BY Region DESC;
GO

SELECT
	CustomerID, Region
FROM dbo.Customers
ORDER BY 
	CASE WHEN Region IS NULL THEN 1 ELSE 0 END, Region DESC;
GO