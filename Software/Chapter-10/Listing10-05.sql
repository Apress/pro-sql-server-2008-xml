USE AdventureWorks;
GO

DECLARE @eContract nvarchar(max);

SET @eContract = N'<?xml version="1.0" encoding="UTF-16"?>

<!DOCTYPE contract SYSTEM "c:\eContracts-Reference.dtd">

<sales-invoice>
</sales-invoice>';

SELECT dbo.fn_ValidateDTD(@eContract);
GO