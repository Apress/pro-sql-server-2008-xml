DECLARE @x xml;
SET @x = '';
SELECT 'fn:round', @x.query('fn:round(-10.4)'),
  @x.query('fn:round(10.4)');
SELECT 'fn:ceiling', @x.query('fn:ceiling(-10.4)'),
  @x.query('fn:ceiling(10.4)');
SELECT 'fn:floor', @x.query('fn:floor(-10.4)'),
  @x.query('fn:floor(10.4)');
GO