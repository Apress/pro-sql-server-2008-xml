DECLARE @x xml;
SET @x = N'<Countries>
  <Country>United States of America</Country>
  <Country>Canada</Country>
  <Country>Mexico</Country>
</Countries>';
SELECT @x.query('123 instance of xs:integer?');
SELECT @x.query('"abc" instance of xs:string?');
SELECT @x.query('(/Countries/Country)[1] instance of element(Country, xdt:untyped?)');
GO