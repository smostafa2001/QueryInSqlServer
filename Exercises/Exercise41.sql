USE NikamoozDB;
GO

SELECT
	C.City,
	MAX(Tmp.OrderCount) AS MaxOrder,
	MIN(Tmp.OrderCount) AS MinOrder
FROM
	(
		SELECT
			COUNT(O.OrderID) AS OrderCount, O.CustomerID
		FROM dbo.Orders AS O
		GROUP BY O.CustomerID
	) AS Tmp
JOIN dbo.Customers AS C
	ON C.CustomerID = Tmp.CustomerID
	WHERE C.City = ' Â—«‰'
GROUP BY C.City;
GO

SELECT DISTINCT
	C.City, Tmp.MaxOrders, Tmp.MinOrders
FROM dbo.Customers AS C
CROSS APPLY
	(
		SELECT
			Tmp_In.City,
			MAX(Tmp_In.Num) AS MaxOrders,
			MIN(Tmp_In.Num) AS MinOrders
		FROM 
			(
				SELECT
					C.City,
					(
						SELECT COUNT(O.OrderID)
						FROM dbo.Orders AS O
							WHERE C.CustomerID = O.CustomerID
					) AS Num
				FROM dbo.Customers AS C
			) AS Tmp_In
		GROUP BY Tmp_In.City
	) AS Tmp
		WHERE C.City = Tmp.City
		AND C.City = N' Â—«‰';
GO

SELECT
	C.City,
	MAX(Tmp.OrderCount) AS MaxOrder,
	MIN(Tmp.OrderCount) AS MinOrder
FROM dbo.Customers AS C
CROSS APPLY
	(
		SELECT
			COUNT(O.OrderID) AS OrderCount
		FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Tmp
	WHERE C.City = ' Â—«‰'
GROUP BY C.City;
GO