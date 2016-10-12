DECLARE @x xml;

SET @x = '';

SELECT @x.query ('if (100 lt 200)
  then "100 is less than 200"
  else "100 is not less than 200"');
GO