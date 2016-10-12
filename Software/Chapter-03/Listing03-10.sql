DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<dessert-menu>
  <item type = "pie">
	<name>Cherry Pie</name>
    <serving-info>
	  <size>1 slice</size>
      <calories>277</calories>
	  <price>2.99</price>
    </serving-info>
  </item>
  <item type = "cookie">
    <name>Peanut Butter Blossom</name>
    <serving-info>
      <size>3 cookies</size>
      <calories>348</calories>
      <price>1.29</price>
    </serving-info>
  </item>
  <item type = "cake">
    <name>German Chocolate Cake</name>
    <serving-info>
      <size>1 slice</size>
      <calories>793</calories>
      <price>3.99</price>
    </serving-info>
  </item>
</dessert-menu>';

SELECT CASE @x.exist(N'/dessert-menu/item[@type eq "pie"]')
	   WHEN 1 THEN 'Pie is on the menu'
	   WHEN 0 THEN 'There is no pie'
       ELSE 'XML instance is NULL'
       END;
GO
