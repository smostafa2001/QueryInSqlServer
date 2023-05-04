USE NikamoozDB;
GO

SELECT
	CustomerID, OrderID
FROM dbo.Orders
ORDER BY CustomerID;
GO

/*
	تعداد سفارش هر مشتری
	GROUP BY Columns: CustomerID
	Aggregate Columns: OrderID
*/

SELECT
	CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID;
GO

/*
	تعداد سفارش هر مشتری و جدیدترین سفارش او
	GROUP BY Columns: CustomerID
	Aggregate Columns: OrderID / OrderDate
*/

SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	MAX(OrderDate) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID;
GO

/*
	گروه بندی چند سطحی
	از هر استان-شهر چه تعداد مشتری داریم
	GROUP BY Columns: [State], City
	Aggregate Columns: CustomerID
*/

SELECT
	[State], City,
	COUNT(CustomerID) AS Num
FROM dbo.Customers
GROUP BY [State], City;
GO