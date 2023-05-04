USE NikamoozDB;
GO

DBCC FREEPROCCACHE;
GO

SELECT * FROM dbo.Employees
	WHERE EmployeeID = 1;
GO

SELECT * FROM sys.dm_exec_cached_plans;
GO

SELECT
	P.bucketid, P.usecounts, P.size_in_bytes, P.objtype, T.text
FROM sys.dm_exec_cached_plans AS P
CROSS APPLY sys.dm_exec_sql_text(P.plan_handle) AS T;
GO

DBCC FREEPROCCACHE;
GO

EXEC GetEmployeeByID 1;
GO

EXEC GetEmployeeByID 4;
GO

EXEC GetEmployeeByID 9;
GO

SELECT
	P.bucketid, P.usecounts, P.size_in_bytes, T.text
FROM sys.dm_exec_cached_plans AS P
CROSS APPLY SYS.dm_exec_sql_text(P.plan_handle) AS T
	WHERE T.text LIKE '%Employees%';
GO

DBCC FREEPROCCACHE;
GO

EXEC sp_executesql 
	N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustomerID',
	N'@CustomerID INT', @CustomerID = 79;
GO

EXEC sp_executesql 
	N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustomerID',
	N'@CustomerID INT', @CustomerID = 3;
GO

EXEC sp_executesql 
	N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustomerID',
	N'@CustomerID INT', @CustomerID = 28;
GO

SELECT
	P.bucketid, P.usecounts, P.size_in_bytes, T.text
FROM sys.dm_exec_cached_plans AS P
CROSS APPLY sys.dm_exec_sql_text(P.plan_handle) AS T
	WHERE T.text LIKE '%Orders%';
GO

DBCC FREEPROCCACHE;
GO

SELECT * FROM dbo.Employees
	WHERE EmployeeID = 1;
GO

SELECT * FROM dbo.Employees
	WHERE EmployeeID=1;
GO

SELECT * FROM dbo.Employees
	WHERE EmployeeID = 1--Employee Code;
GO

SELECT
	P.bucketid, P.usecounts, P.size_in_bytes, T.text
FROM sys.dm_exec_cached_plans AS P
CROSS APPLY sys.dm_exec_sql_text(P.plan_handle) AS T;
GO