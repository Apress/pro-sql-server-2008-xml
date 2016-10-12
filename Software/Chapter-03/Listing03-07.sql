DECLARE @x xml;

SET @x = CONVERT(xml, N'<?xml version="1.0"?>
<!DOCTYPE meal [
    <!ATTLIST bread type CDATA "quick bread">
    <!ENTITY copyright "&#xA9; 2007 by Apress Chefs, Inc.">
]>
<meal>
    <food>
        <meat type="beef">Steak</meat>
        <vegetable type="legume">Green Beans</vegetable>
        <bread>Cornbread</bread>
        &copyright;
    </food>
</meal>', 2);

SELECT @x;
GO