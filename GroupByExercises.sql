USE NikamoozDB;
GO

SELECT
	COUNT(OrderID) AS Num_Orders
FROM dbo.Orders
	WHERE OrderDate > '2016-05-04'
GO
-----------------------------------------
SELECT
	YEAR(O.OrderDate) AS OrderYear,
	MONTH(O.OrderDate) AS OrderMonth,
	Count(O.OrderID) AS Num
FROM dbo.Orders AS O
	WHERE MONTH(O.OrderDate) = 2
GROUP BY
	YEAR(OrderDate),
	MONTH(OrderDate);
GO
-----------------------------------------
SELECT
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	AVG(Freight) AS AVG_Freight
FROM dbo.Orders
GROUP BY
	YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear;
GO
-----------------------------------------
SELECT
	CustomerID,
	COUNT(OrderID) AS Num,
	MAX(OrderDate) AS New_Order,
	MIN(OrderDate) AS Old_Order
FROM dbo.Orders
	WHERE OrderDate BETWEEN '2015-01-01' AND '2015-03-31'
GROUP BY 
	CustomerID
	HAVING COUNT(OrderID) > 2;