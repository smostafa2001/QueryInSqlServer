SELECT
	 DISTINCT E.[State], E.Region, E.City
FROM dbo.Employees AS E
INNER JOIN dbo.Customers AS C
	ON E.State = C.State
	AND E.Region = C.Region
	AND E.City = E.City;
GO