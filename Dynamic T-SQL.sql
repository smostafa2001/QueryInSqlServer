USE NikamoozDB;
GO

DECLARE @Col VARCHAR(50) = 'CustomerID';
SELECT @Col FROM dbo.Customers;
GO

DECLARE @Col VARCHAR(50) = 'CustomerID';
SELECT * FROM dbo.Customers
	WHERE @Col > 80;
GO

DECLARE @Col VARCHAR(50) = 'CustomerID';
DECLARE @Sql VARCHAR(200) = 'SELECT ' + @Col + ' FROM dbo.Customers';
PRINT @Sql
EXECUTE(@Sql);
GO

DECLARE @City NVARCHAR(20) = N'شیراز';
DECLARE @Sql NVARCHAR(200) = N'SELECT * FROM dbo.Customers WHERE City = N''' + @City + '''';
PRINT @Sql;
EXECUTE(@Sql);
GO

DECLARE @Col NVARCHAR(50) = 'CustomerID';
DECLARE @Sql NVARCHAR(200) = 'SELECT ' + @Col + ' FROM dbo.Customers';
PRINT @Sql;
EXEC sp_executesql @Sql;
GO

EXEC sp_executesql N'SELECT CustomerID FROM dbo.Customers';
GO

EXEC sp_executesql 'SELECT @@VERSION';
GO

EXEC sp_executesql N'SELECT @@VERSION';
GO

EXEC sp_executesql N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustomerID',
	N'@CustomerID INT', @CustomerID = 80;
GO

EXEC sp_executesql N'SELECT * FROM dbo.Orders WHERE OrderID = @OrderID AND CustomerID = @CustomerID',
	N'@OrderID INT, @CustomerID INT', @OrderID=10249, @CustomerID=79;
GO

DECLARE @Sql AS NVARCHAR(100);
SET @Sql = N'SELECT OrderID, CustomerID, EmployeeID, Orderdate FROM dbo.Orders WHERE OrderID = @OrderID;';
EXEC sp_executesql
	@Statement = @Sql,
	@Params = N'@OrderID AS INT',
	@OrderID = 10250;
GO

DECLARE @Sql AS NVARCHAR(100);
SET @Sql = 
	N'SELECT
		OrderID, CustomerID, EmployeeID, OrderDate
	FROM dbo.Orders
		WHERE OrderID BETWEEN @Min AND @Max';
PRINT @Sql;
EXEC sp_executesql
	@Statement = @Sql,
	@Params = N'@Min AS INT, @Max AS INT',
	@Min = 10248, @Max = 10250;
GO