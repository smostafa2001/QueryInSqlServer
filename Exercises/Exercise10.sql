USE NikamoozDB;
GO

SELECT
	C.CustomerID,
	DATEDIFF(DAY, MIN(O.OrderDate), MAX(O.OrderDate)) AS Day_Diff
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON O.CustomerID = C.CustomerID
	WHERE C.[State] = N'«’›Â«‰'
GROUP BY C.CustomerID;
GO