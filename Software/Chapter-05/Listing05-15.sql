USE AdventureWorks;
GO

DECLARE @x XML;
SET @x = N'';
SELECT @x.query ('
<Measurement>
  One dozen is equal to { 5 + 7 }
</Measurement>');
GO