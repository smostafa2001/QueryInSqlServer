USE NikamoozDB;
GO

SELECT
	C.CompanyName,
	COUNT(O.OrderID)
FROM dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
	ON C.CustomerID = O.CustomerID
	WHERE C.[State] = N'“‰Ã«‰'
GROUP BY C.CompanyName;
GO

--THE RESULT IS NOT CORRECT!
--SELECT
--	C.CompanyName,
--	COUNT(O.OrderID)
--FROM dbo.Customers AS C
--LEFT JOIN dbo.Orders AS O
--	ON C.CustomerID = O.CustomerID
--	AND C.[State] = N'“‰Ã«‰'
--GROUP BY C.CompanyName;
--GO

SELECT
	C.CompanyName,
	(
		SELECT COUNT(OrderID) FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C
	WHERE C.[State] = N'“‰Ã«‰';
GO

SELECT
	C.CompanyName,
	(
		SELECT COUNT(*) FROM dbo.Orders AS O
			WHERE C.CustomerID = O.CustomerID
	) AS Num
FROM dbo.Customers AS C
	WHERE C.[State] = N'“‰Ã«‰';
GO

----THE RESULT IS INCORRECT!
--SELECT
--	C.CompanyName,
--	(
--		SELECT COUNT(OrderID) FROM dbo.Orders AS O
--			WHERE C.CustomerID = O.CustomerID
--			AND C.[State] = N'“‰Ã«‰'
--	) AS Num
--FROM dbo.Customers AS C;
--GO

----THE RESULT IS INCORRECT!
--SELECT
--	(
--		SELECT C.CompanyName
--		FROM dbo.Customers AS C
--			WHERE C.CustomerID = O.CustomerID
--			AND C.[State] = N'“‰Ã«‰'
--	) AS CompanyName, 
--	COUNT(OrderID) AS Num
--FROM dbo.Orders AS O
--GROUP BY O.CustomerID;