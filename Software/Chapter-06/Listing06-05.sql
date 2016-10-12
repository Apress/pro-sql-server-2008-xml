DECLARE @x xml;
SET @x = '';
SELECT @x.query('fn:not( fn:false() )');
SELECT @x.query('fn:not( 10 lt 3 )');
GO