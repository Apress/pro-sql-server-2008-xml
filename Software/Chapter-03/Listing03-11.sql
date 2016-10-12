DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<bill-of-materials>
  <finished-good name = "kiddie picnic table">
    <material name = "pine lumber">
      <item qty = "2">
        <dimensions uom = "mm">50 x 50 x 1100</dimensions>
      </item>
      <item qty = "4">
        <dimensions uom = "mm">50 x 25 x 800</dimensions>
      </item>
      <item qty = "8">
        <dimensions uom = "mm">50 x 25 x 400</dimensions>
      </item>
      <item qty = "2">
        <dimensions uom = "mm">50 x 50 x 475</dimensions>
      </item>
      <item qty = "4">
        <dimensions uom = "mm">50 x 50 x 180</dimensions>
      </item>
      <item qty = "6">
        <dimensions uom = "mm">50 x 50 x 75</dimensions>
      </item>	
      <item qty = "5">
        <dimensions uom = "mm">100 x 25 x 800</dimensions>
      </item>
      <item qty = "8">
        <dimensions uom = "mm">50 x 25 x 800</dimensions>
      </item>
    </material>
    <material name="bolts">
      <item qty = "6">
        <dimensions uom = "mm">100 x 7</dimensions>
      </item>
      <item qty = "24">
        <dimensions uom = "mm">75 x 7</dimensions>
      </item>
    </material>
    <material name="washers">
      <item qty = "30">
        <dimensions uom = "mm">7</dimensions>
      </item>
    </material>
    <material name="nuts">
      <item qty = "30">
        <dimensions uom = "mm">7</dimensions>
      </item>
    </material>
    <material name = "8-gauge treated screws">
      <item qty = "36">
        <dimensions uom = "mm">45</dimensions>
      </item>
    </material>
  </finished-good>
</bill-of-materials>';

SELECT my_table. my_col.value(N'../@name', N'nvarchar(100)') AS Material,
    my_table. my_col.value(N'(./dimensions)[1]', N'nvarchar(50)') AS Dimensions,
    my_table. my_col.value(N'(./dimensions/@uom)[1]', N'nvarchar(10)') AS UOM,
    my_table. my_col.value(N'./@qty', N'int') AS Quantity
FROM @x.nodes(N'//item') AS my_table ( my_col );
GO
