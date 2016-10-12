USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION UnionSchemaCollection
AS
N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="nonZeroInteger">
    <xsd:simpleType>
      <xsd:union>
        <xsd:simpleType>
          <xsd:restriction base = "xsd:negativeInteger"/>
        </xsd:simpleType>
        <xsd:simpleType>
          <xsd:restriction base = "xsd:positiveInteger"/>
        </xsd:simpleType>
      </xsd:union>
    </xsd:simpleType>
  </xsd:element>
</xsd:schema>';
GO

DECLARE @x xml (UnionSchemaCollection);
SET @x = N'<nonZeroInteger>1</nonZeroInteger>';
SELECT @x;
GO
