DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<inventory store-number = "9834">
  <product ean = "051500241776">
    <name>Jif Creamy Peanut Butter</name>
    <size>28 oz</size>
  </product>
  <product ean = "0024600010030">
    <name>Morton Iodized Salt</name>
    <size>26 oz</size>
  </product>
  <product ean = "0086600000138">
    <name>Bumble Bee Chunked White Albacore in Water</name>
    <size>6 oz</size>
  </product>
  <product ean = "0013130006125">
    <name>Cream of Wheat Enriched Farina</name>
    <company>Nabisco</company>
    <size>28 oz</size>
  </product>
</inventory>';

SET  @x.modify (N'delete (/inventory/product[@ean = "0086600000138"]/name)');

SELECT @x;
GO
