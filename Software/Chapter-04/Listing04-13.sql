USE AdventureWorks;
GO
CREATE XML SCHEMA COLLECTION dbo.ComplexBOMSchema_Typed
AS
N'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

  <xsd:element name="items">
    <xsd:complexType>
        <xsd:sequence>
          <xsd:element ref="item" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="item">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="name" minOccurs="1" maxOccurs="1" type="xsd:string" />
        <xsd:element name="color" minOccurs="0" maxOccurs="1" type="xsd:string" />
        <xsd:group ref="price-group" minOccurs="1" maxOccurs="1" />
        <xsd:element name="quantity" minOccurs="1" maxOccurs="1" type="xsd:decimal" />
        <xsd:group ref="size-group" minOccurs="0" maxOccurs="1" />
        <xsd:any processContents="lax" namespace="##other" minOccurs="0"
            maxOccurs="unbounded" />
        <xsd:element ref="item" minOccurs="0" maxOccurs="unbounded" />
      </xsd:sequence>
      <xsd:attributeGroup ref="id-attr-group" />
    </xsd:complexType>
  </xsd:element>

  <xsd:attributeGroup name="id-attr-group">
    <xsd:attribute name="id" type="xsd:integer" />
	<xsd:attribute name="number" type="xsd:string" />
  </xsd:attributeGroup>

  <xsd:group name="price-group">
    <xsd:choice>      
      <xsd:element name="list-price" minOccurs="1" maxOccurs="1" type="xsd:decimal" />
      <xsd:element name="standard-cost" minOccurs="1" maxOccurs="1" type="xsd:decimal" />
    </xsd:choice>
  </xsd:group>
 
  <xsd:group name="size-group">
    <xsd:sequence>
      <xsd:element name="size" minOccurs="1" maxOccurs="1" type="xsd:string" />
      <xsd:element name="unit-of-measure" minOccurs="1" maxOccurs="1" type="xsd:string" />
    </xsd:sequence>
  </xsd:group>

</xsd:schema>';
GO

DECLARE @ProductID int;
SET @ProductID = 749;

DECLARE @x XML (dbo.ComplexBOMSchema_Typed);

WITH XMLNAMESPACES ('urn:apress:bom-misc' AS misc)
SELECT @x =
(
  SELECT a.ComponentID AS "@id",
  p.ProductNumber AS "@number",
  p.Name AS "name",
  p.Color AS "color",
  p.ListPrice AS "list-price",
  a.PerAssemblyQty AS "quantity",
  p.Size AS "size",
  p.SizeUnitMeasureCode AS "unit-of-measure",
  ( 
    SELECT RTRIM(pmpdc.CultureID) AS "misc:description/@xml:lang",
      pd.Description AS "misc:description" 
    FROM Production.Product p1 
    INNER JOIN Production.ProductModel pm 
      ON p1.ProductModelID = pm.ProductModelID 
    INNER JOIN Production.ProductModelProductDescriptionCulture pmpdc 
      ON pm.ProductModelID = pmpdc.ProductModelID 
    INNER JOIN Production.ProductDescription pd 
      ON pmpdc.ProductDescriptionID = pd.ProductDescriptionID 
    WHERE p1.ProductID = a.ComponentID 
    FOR XML PATH (''), ROOT('misc:product-info'), TYPE
  ),
  (
    SELECT b.ComponentID AS "@id",
      p.ProductNumber AS "@number",
      p.Name AS "name",
      p.Color AS "color",
      p.ListPrice AS "list-price",
      b.PerAssemblyQty AS "quantity",
      p.Size AS "size",
      p.SizeUnitMeasureCode AS "unit-of-measure",
      (
        SELECT c.ComponentID AS "@id",
          p.ProductNumber AS "@number",
          p.Name AS "name",
          p.Color AS "color",
          p.ListPrice AS "list-price",
          c.PerAssemblyQty AS "quantity",
          p.Size AS "size",
          p.SizeUnitMeasureCode AS "unit-of-measure",
          (
            SELECT d.ComponentID AS "@id",
              p.ProductNumber AS "@number",
              p.Name AS "name",
              p.Color AS "color",
              p.ListPrice AS "list-price",
              d.PerAssemblyQty AS "quantity",
              p.Size AS "size",
              p.SizeUnitMeasureCode AS "unit-of-measure",
              (  
                SELECT e.ComponentID AS "@id",
                  p.ProductNumber AS "@number",
                  p.Name AS "name",
                  p.Color AS "color",
                  p.ListPrice AS "list-price",
                  e.PerAssemblyQty AS "quantity",
                  p.Size AS "size",
                  p.SizeUnitMeasureCode AS "unit-of-measure"
                FROM Production.BillOfMaterials e 
                INNER JOIN Production.Product p 
                  ON e.ComponentID = p.ProductID 
                WHERE e.ProductAssemblyID = d.ComponentID 
                  AND e.EndDate IS NULL
                FOR XML PATH (N'item'), TYPE
              )
            FROM Production.BillOfMaterials d 
            INNER JOIN Production.Product p 
              ON d.ComponentID = p.ProductID 
            WHERE d.ProductAssemblyID = c.ComponentID 
              AND d.EndDate IS NULL
            FOR XML PATH (N'item'), TYPE
          )
        FROM Production.BillOfMaterials c 
        INNER JOIN Production.Product p 
          ON c.ComponentID = p.ProductID 
        WHERE c.ProductAssemblyID = b.ComponentID
          AND c.EndDate IS NULL
        FOR XML PATH (N'item'), TYPE
      )
    FROM Production.BillOfMaterials b 
    INNER JOIN Production.Product p 
      ON b.ComponentID = p.ProductID 
    WHERE b.ProductAssemblyID = a.ComponentID 
      AND b.EndDate IS NULL
    FOR XML PATH(N'item'), TYPE
  )
FROM Production.BillOfMaterials a 
INNER JOIN Production.Product p 
  ON a.ComponentID = p.ProductID 
WHERE p.ProductID = @ProductID
  AND a.EndDate IS NULL
FOR XML PATH(N'item'), ROOT(N'items'), TYPE
);

SELECT @x;
GO

DROP XML SCHEMA COLLECTION dbo.ComplexBOMSchema_Typed;
