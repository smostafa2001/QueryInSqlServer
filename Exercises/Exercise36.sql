USE NikamoozDB;
GO

SELECT
	(
		SELECT C.City
		FROM dbo.Customers AS C
			WHERE 
				C.CustomerID = O.CustomerID
				AND C.City IN(N'تهران', N'شیراز', N'اصفهان')
			
	) AS City,
	COUNT(O.OrderID) AS Num
FROM dbo.Orders AS O
GROUP BY O.CustomerID;
GO

SELECT
	C.City,
	(
		SELECT COUNT(O.OrderID)
		FROM dbo.Orders AS O
			WHERE
				EXISTS
					(
						SELECT 1
						FROM dbo.Customers AS C1
							WHERE
								C1.CustomerID = O.CustomerID
								AND
								C.City = C1.City
					)
	) AS Num
FROM dbo.Customers AS C
	WHERE C.City IN(N'تهران', N'شیراز', N'اصفهان')
GROUP BY C.City;
GO

SELECT
	Tmp.City,
	SUM(Tmp.Num) AS Num
FROM
	(
		SELECT
			C.City,
			(
				SELECT COUNT(O.OrderID)
				FROM dbo.Orders AS O
					WHERE O.CustomerID = C.CustomerID
			) AS Num
		FROM dbo.Customers AS C
			WHERE C.City IN(N'تهران', N'شیراز', N'اصفهان')
		GROUP BY C.City, C.CustomerID
	) AS Tmp
GROUP BY Tmp.City;
GO

WITH CTE
AS
	(
		SELECT
			C.City,
			(
				SELECT COUNT(O.OrderID)
				FROM dbo.Orders AS O
					WHERE O.CustomerID = C.CustomerID
			) AS Num
		FROM dbo.Customers AS C
			WHERE C.City IN(N'تهران', N'شیراز', N'اصفهان')
		GROUP BY C.City, C.CustomerID
	)
SELECT
	City, SUM(Num) AS Num
FROM CTE
GROUP BY City;
GO

SELECT
	C.City,
	COUNT(O.OrderID) AS Num
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.City IN(N'تهران', N'شیراز', N'اصفهان')
GROUP BY C.City;
GO