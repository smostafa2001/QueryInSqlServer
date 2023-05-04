USE NikamoozDB;
GO

SELECT
	[State], Region, City FROM dbo.Employees
EXCEPT
SELECT
	[State], Region, City FROM dbo.Customers;
GO

SELECT
	[State], Region, City FROM dbo.Customers
EXCEPT
SELECT
	[State], Region, City FROM dbo.Employees;
GO

(
	SELECT
		[State], Region, City FROM dbo.Suppliers
	EXCEPT
	SELECT
		[State], Region, City FROM dbo.Employees
)
INTERSECT
SELECT
	[State], Region, City FROM dbo.Customers;
GO