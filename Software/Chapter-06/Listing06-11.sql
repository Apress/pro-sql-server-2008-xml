USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION StateSchema 
AS N'<xsd:schema xmlns:xsd = "http://www.w3.org/2001/XMLSchema">
  <xsd:element name = "Country">
    <xsd:complexType>
      <xsd:sequence>
          <xsd:element name = "Region" minOccurs = "0" maxOccurs = "unbounded">
          <xsd:complexType mixed="true">
            <xsd:attribute name = "id" type = "xsd:ID"/>
          </xsd:complexType>
          </xsd:element>  
          <xsd:element name = "State" minOccurs = "0" maxOccurs = "unbounded">
          <xsd:complexType> 
            <xsd:attribute name = "area" type = "xsd:IDREF" />
            <xsd:attribute name = "id" type = "xsd:ID" /> 
            <xsd:attribute name = "name" type = "xsd:string" />  
          </xsd:complexType>
        </xsd:element>
      </xsd:sequence> 
      <xsd:attribute name = "id" type = "xsd:ID" />
      <xsd:attribute name = "name" type = "xsd:string" />
    </xsd:complexType>
  </xsd:element>
</xsd:schema>';
GO

DECLARE @x xml(StateSchema);

SET @x = N'<Country name = "United States" id = "US">
  <Region id = "East-Coast">The east coast of the United States</Region>
  <Region id = "West-Coast">The west coast of the United States</Region>
  <State name = "New Jersey" id = "NJ" area = "East-Coast" />
  <State name = "New York" id = "NY" area = "East-Coast" />
  <State name = "California" id = "CA" area = "West-Coast" />
  <State name = "Washington" id = "WA" area = "West-Coast" />
</Country>';

SELECT @x.query('fn:id((/Country/State[@id="NJ"]/@area))');
GO
