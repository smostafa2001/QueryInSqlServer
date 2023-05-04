USE NikamoozDB;
GO

SELECT
	E1.FirstName, E1.LastName,
	E2.FirstName, E2.LastName
FROM dbo.Employees AS E1
CROSS JOIN dbo.Employees AS E2
ORDER BY E1.FirstName, E1.LastName;
GO