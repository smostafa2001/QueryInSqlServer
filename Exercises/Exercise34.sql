SELECT
	YEAR(O1.OrderDate) AS OrderYear,
	COUNT(DISTINCT O1.CustomerID) AS Cust_Num,
	COUNT(DISTINCT O2.CustomerID) AS Previous_Cust_Num,
	COUNT(DISTINCT O1.CustomerID) - COUNT(DISTINCT O2.CustomerID) AS Growth
FROM dbo.Orders AS O1
LEFT JOIN dbo.Orders AS O2
	ON YEAR(O1.OrderDate) = YEAR(O2.OrderDate) + 1
GROUP BY YEAR(O1.OrderDate), YEAR(O2.OrderDate);
GO

WITH CustomersPerYear
AS
(
	SELECT
		YEAR(O1.OrderDate) AS OrderYear,
		COUNT(DISTINCT O1.CustomerID) AS Cust_Num
	FROM dbo.Orders AS O1
	GROUP BY YEAR(O1.OrderDate)
)
SELECT
	CPY1.OrderYear,
	CPY1.Cust_Num,
	ISNULL(CPY2.Cust_Num, 0) AS Previous_Cust_Num,
	CPY1.Cust_Num - ISNULL(CPY2.Cust_Num, 0) AS Growth
FROM CustomersPerYear AS CPY1
LEFT JOIN CustomersPerYear AS CPY2
	ON CPY1.OrderYear = CPY2.OrderYear + 1;
GO

SELECT
	Current_Year.OrderYear,
	Current_Year.Cust_Num,
	ISNULL(Previous_Year.Cust_Num, 0) AS Previous_Cust_Num,
	Current_Year.Cust_Num - ISNULL(Previous_Year.Cust_Num, 0) AS Growth
FROM
	(
		SELECT
			YEAR(OrderDate) AS OrderYear,
			COUNT(DISTINCT CustomerID) AS Cust_Num
		FROM dbo.Orders
		GROUP BY YEAR(OrderDate)
	) AS Current_Year
LEFT JOIN
	(
		SELECT
			YEAR(OrderDate) AS OrderYear,
			COUNT(DISTINCT CustomerID) AS Cust_Num
		FROM dbo.Orders
		GROUP BY YEAR(OrderDate)
	) AS Previous_Year
	ON Current_Year.OrderYear = Previous_Year.OrderYear + 1;
GO

SELECT
	YEAR(Current_Year.OrderDate) AS OrderYear,
	COUNT(DISTINCT Current_Year.CustomerID) AS Cust_Num,
	ISNULL
		(
			(
				SELECT
					COUNT(DISTINCT O.CustomerID)
				FROM dbo.Orders AS O
					WHERE YEAR(Current_Year.OrderDate) = 
						YEAR(O.OrderDate) + 1
				GROUP BY YEAR(O.OrderDate)
			), 0
		) AS Previous_Cust_Num,
	COUNT(DISTINCT Current_Year.CustomerID) -
		ISNULL
		(
			(
				SELECT
					COUNT(DISTINCT O.CustomerID)
				FROM dbo.Orders AS O
					WHERE YEAR(Current_Year.OrderDate) = 
						YEAR(O.OrderDate) + 1
				GROUP BY YEAR(O.OrderDate)
			), 0
		) AS Growth
FROM dbo.Orders AS Current_Year
GROUP BY YEAR(Current_Year.OrderDate);
GO

WITH Current_Year
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		COUNT(DISTINCT CustomerID) AS Cust_Num
	FROM dbo.Orders
	GROUP BY YEAR(OrderDate)
),
Previous_Year
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		COUNT(DISTINCT CustomerID) AS Cust_Num
	FROM dbo.Orders
	GROUP BY YEAR(OrderDate)
)
SELECT
	Current_Year.OrderYear,
	Current_Year.Cust_Num,
	ISNULL(Previous_Year.OrderYear, 0) AS Previous_Cust_Num,
	Current_Year.Cust_Num - ISNULL(Previous_Year.Cust_Num, 0) AS Growth
FROM Current_Year
LEFT JOIN Previous_Year
	ON Current_Year.OrderYear = Previous_Year.OrderYear + 1;
GO