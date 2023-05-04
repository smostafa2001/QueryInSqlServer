WITH CustomerPerYear
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		CustomerID
	FROM dbo.Orders
)
SELECT
	CPY.OrderYear,
	COUNT(DISTINCT CPY.CustomerID) AS Customers_Num
FROM CustomerPerYear AS CPY
GROUP BY CPY.OrderYear;
GO