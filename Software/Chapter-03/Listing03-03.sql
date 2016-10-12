DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<partners>
<![CDATA[
    Dewey, Cheatham, & Howe
]]>
</partners>';

SELECT @x;
GO