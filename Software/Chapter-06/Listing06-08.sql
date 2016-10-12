DECLARE @x xml;
SET @x = '';
SELECT @x.query('fn:min((1, 2.9, 3.14, 4, 5.0))');
SELECT @x.query('fn:max(("Florida", "California", "Georgia"))');
GO