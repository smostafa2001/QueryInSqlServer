USE NikamoozDB;
GO

SELECT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE O.CustomerID = 1
EXCEPT
SELECT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE O.CustomerID = 2;
GO

SELECT DISTINCT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE O.EmployeeID IN 
		(
			SELECT
				EmployeeID
			FROM dbo.Orders AS O1
				WHERE CustomerID = 1
		) AND O.EmployeeID NOT IN
		(
			SELECT
				EmployeeID
			FROM dbo.Orders AS O2
				WHERE CustomerID = 2
		);
GO

SELECT DISTINCT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE O.CustomerID = 1
	AND O.EmployeeID NOT IN 
		(
			SELECT
				EmployeeID
			FROM dbo.Orders AS O2
				WHERE CustomerID = 2
		);
GO

SELECT DISTINCT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O1
				WHERE O.EmployeeID = O1.EmployeeID
				AND CustomerID = 1
		) AND NOT EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O2
				WHERE O.EmployeeID = O2.EmployeeID
				AND CustomerID = 2
		);
GO

SELECT DISTINCT
	O.EmployeeID
FROM dbo.Orders AS O
	WHERE O.CustomerID = 1
	AND NOT EXISTS 
		(
			SELECT 1
			FROM dbo.Orders AS O2
				WHERE CustomerID = 2
				AND O.EmployeeID = O2.EmployeeID
		);
GO