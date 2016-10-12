DECLARE @x xml;
SELECT @x = N'';
SELECT @x.query('(3.141592, 1.414214, 1.0079)');
