DECLARE @x xml;
SET @x = N'';
SELECT @x.query('xs:integer(12345.6) + xs:decimal(1)');
SELECT @x.query('fn:true()');
SELECT @x.query('xs:dateTime("2007-10-31T12:32:46-05:00")');
GO