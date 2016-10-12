DECLARE @x xml;
SET @x = '';
SELECT @x.query(' "123.4567" cast as xs:decimal? ');

