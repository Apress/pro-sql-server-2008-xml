DECLARE @x xml;
SELECT @x = N'';
SELECT @x.query('(1, 1, 2, (), 3, 4, 5, 10, (9, 8), 6, 7)');
