USE NikamoozDB;
GO

DROP FUNCTION IF EXISTS dbo.Abbreviation;
GO

CREATE FUNCTION dbo.Abbreviation
	(@FirstName NVARCHAR(50), @LastName NVARCHAR(100))
	RETURNS NCHAR(3)
AS
BEGIN
	DECLARE @Output NCHAR(3);
	SET @Output = LEFT(@FirstName, 1) + '.' + LEFT(@LastName, 1);
	RETURN @Output;
END
GO

SELECT dbo.Abbreviation(N'سعید', N'پاشایی');
GO

SELECT
	EmployeeID, FirstName, LastName,
	dbo.Abbreviation(FirstName, LastName)
FROM dbo.Employees;
GO

DROP FUNCTION IF EXISTS dbo.GetAge;
GO

CREATE FUNCTION dbo.GetAge(@BirthDate DATE)
	RETURNS TINYINT
AS
BEGIN
	RETURN DATEDIFF(YEAR, @BirthDate, GETDATE());
END
GO

SELECT
	EmployeeID, FirstName, LastName,
	dbo.GetAge(Birthdate) AS Age
FROM dbo.Employees;
GO