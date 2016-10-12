DECLARE @x xml;

SET @x = '';

SELECT @x.query ('some $x in (1, 2, 3)
  satisfies $x * $x = 9');

SELECT @x.query ('every $x in (1, 2, 3)
  satisfies $x * $x = 9');
GO