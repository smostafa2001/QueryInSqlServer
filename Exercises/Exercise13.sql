USE NikamoozDB;
GO

SELECT
	E.LastName,
	COUNT(OrderID) AS Num_Orders
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE DATEDIFF(YEAR, E.Birthdate, GETDATE()) > 50
GROUP BY E.LastName
	HAVING COUNT(OrderID) > 100;
GO