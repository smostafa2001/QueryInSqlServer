USE NikamoozDB;
GO

SELECT CustomerID
FROM dbo.Customers AS C
	WHERE C.[State] = N'“‰Ã«‰'
	AND C.CustomerID IN 
		(
			SELECT O.CustomerID 
			FROM dbo.Orders AS O
		);
GO

SELECT C.CustomerID
FROM dbo.Customers AS C
	WHERE C.[State] = N'“‰Ã«‰'
	AND EXISTS 
		(
			SELECT 1
			FROM dbo.Orders AS O
				WHERE O.CustomerID = C.CustomerID
		);
GO

SELECT DISTINCT C.CustomerID
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON O.CustomerID = C.CustomerID
	WHERE C.[State] = N'“‰Ã«‰';
GO