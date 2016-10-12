DECLARE @x XML;
SET @x = '';
SELECT @x.query('42'), @x.query('(2+3)*4');
