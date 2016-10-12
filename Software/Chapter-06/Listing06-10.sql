DECLARE @x xml;
SET @x = N'';
SELECT @x.query('fn:empty( () )');
SELECT @x.query('fn:distinct-values( (1.0, 1, 2.0, 4.0, 8, 8.00) )');
GO