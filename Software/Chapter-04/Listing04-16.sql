USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION ListSchemaCollection
AS
N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="ProductNumberList">
    <xsd:simpleType>
      <xsd:list>
        <xsd:simpleType>
          <xsd:restriction base = "xsd:string">
            <xsd:pattern 
              value = "[A-Z]{2}-[0-9A-Z][0-9]{2}[0-9A-Z](-([0-9]{2}|[BLMRSX]))?" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:list>
    </xsd:simpleType>
  </xsd:element>
</xsd:schema>';
GO

DECLARE @x xml (ListSchemaCollection);

SET @x = N'<ProductNumberList>RM-M823 FR-R92B-58 
  CB-2903 FR-M94B-42</ProductNumberList>';

SELECT @x;
GO
