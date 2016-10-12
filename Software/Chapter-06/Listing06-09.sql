DECLARE @x xml;
SET @x = N'';
SELECT @x.query('fn:sum( (1, 2.9, 3, 4, 5.0) )');
SELECT @x.query('fn:avg( (5, 6, 7.0, 8, 9) )');
GO