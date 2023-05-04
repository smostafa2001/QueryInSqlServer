USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.EmployeeAge;
GO

SELECT
	EmployeeID, Birthdate
INTO dbo.EmployeeAge
FROM dbo.Employees;
GO

SELECT * FROM dbo.EmployeeAge;
GO

DELETE FROM E
FROM dbo.EmployeeAge AS E
	WHERE DATEDIFF(YEAR, Birthdate, '2020-10-22') > 51;
GO

SELECT
	E.EmployeeID,
	DATEDIFF(YEAR, E.Birthdate, '2020-10-22')
FROM dbo.EmployeeAge AS E;
GO