DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<book>
  <title>Harry Potter and the Deathly Hallows</title>
  <author>Rowling, J.K.</author>
  <isbn>0545010225</isbn>
  <release-date>2007-07-21Z</release-date>
  <price>34.99</price>
</book>';

SELECT @x.value(N'(/book/price)[1]', 'decimal(5, 2)') AS Price,
    @x.value(N'(/book/release-date)[1]', 'date') AS Release_Date;
GO