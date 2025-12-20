CREATE XML SCHEMA COLLECTION [dbo].[ProductAttributeSchema]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="Attribute" type="ProductAttribute" />
  <xsd:complexType name="ProductAttribute">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name" type="xsd:string" />
          <xsd:element name="Price" type="xsd:decimal" />
          <xsd:element name="Weight" type="xsd:decimal" />
          <xsd:element name="Height" type="xsd:decimal" />
          <xsd:element name="Width" type="xsd:decimal" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';

