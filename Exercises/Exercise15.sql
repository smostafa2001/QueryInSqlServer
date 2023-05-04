USE NikamoozDB;
GO

SELECT
	YEAR(OrderDate) AS OrderYear,
	COUNT
	(
		CASE
			WHEN MONTH(OrderDate) > 6 THEN 1 END
	) AS Num
FROM dbo.Orders
GROUP BY YEAR(OrderDate);
GO

SELECT
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE MONTH(OrderDate) > 6
GROUP BY ALL YEAR(OrderDate);