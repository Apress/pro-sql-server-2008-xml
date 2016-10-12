DECLARE @x xml;
SET @x = N'';
SELECT @x.query('fn:concat("Germ", "any")');
SELECT @x.query('fn:substring("Early to bed and early to rise...", 10, 3)');
SELECT @x.query('fn:string-length("A penny saved is a penny earned")');
SELECT @x.query('fn:contains("Teach a man to fish", "fish")');
GO