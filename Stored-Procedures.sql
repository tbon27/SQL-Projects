-- STORED PROCEDURE ASSIGNMENT

USE AdventureWorks2017
GO
CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
EXEC dbo.uspGetAddress

DROP PROCEDURE IF EXISTS dbo.uspGetAddress

 -- SCHEMA ASSIGNMENT

USE AdventureWorks2017
CREATE SCHEMA [ACADEMY_HR] AUTHORIZATION [dbo]

DROP SCHEMA IF EXISTS [ACADEMY_HR]

-- SSMS assignment

BEGIN TRY
	SELECT 1000/0 AS Result;
END TRY
BEGIN CATCH
	SELECT
		ERROR_NUMBER() AS [ErrorCode],
		ERROR_PROCEDURE() AS [Invalid_Proc],
		ERROR_MESSAGE() AS [Error_Details];
END CATCH


-- pass information into a stored procedure
CREATE PROC dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
GO
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode= '[98]%'

-- pass information out of a stored procedure
CREATE PROCEDURE dbo.uspGetAddress4 @CityName nvarchar(30) OUTPUT
AS 
SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO
DECLARE @CityNAme nvarchar(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT
PRINT @CityName

SELECT * FROM Person.Person