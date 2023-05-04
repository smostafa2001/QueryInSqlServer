USE NikamoozDB;
GO

SELECT
	TOP(1) WITH TIES EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY EmployeeID
ORDER BY Num;
GO

SELECT
	TOP(1) WITH TIES E.EmployeeID, E.FirstName, E.LastName
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY COUNT(OrderID);
GO

SELECT
	E.EmployeeID, E.FirstName, E.LastName
FROM dbo.Employees AS E
	WHERE E.EmployeeID IN 
		(
			SELECT 
				TOP(1) WITH TIES EmployeeID
			FROM dbo.Orders
			GROUP BY EmployeeID
			ORDER BY COUNT(OrderId)
		);
GO

SELECT
	E.EmployeeID, E.FirstName, E.LastName
FROM dbo.Employees AS E
	WHERE E.EmployeeID =
		(
			SELECT 
				TOP(1) WITH TIES EmployeeID
			FROM dbo.Orders
			GROUP BY EmployeeID
			ORDER BY COUNT(OrderId)
		);
GO

SELECT
	TOP(1) WITH TIES O.EmployeeID,
	(
		SELECT E.FirstName
		FROM dbo.Employees AS E
			WHERE E.EmployeeID = O.EmployeeID
	) AS FirstName,
	(
		SELECT E.LastName
		FROM dbo.Employees AS E
			WHERE E.EmployeeID = O.EmployeeID
	) AS LastName
FROM dbo.Orders AS O
GROUP BY O.EmployeeID
ORDER BY COUNT(O.OrderID);
GO

SELECT
	TOP(1) WITH TIES
	E.EmployeeID,
	E.FirstName,
	E.LastName
FROM dbo.Employees AS E
ORDER BY
(
	SELECT COUNT(OrderID)
	FROM dbo.Orders AS O
		WHERE O.EmployeeID = E.EmployeeID
);
GO