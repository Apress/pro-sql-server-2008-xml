private static SqlXml CastXmlDoc_SqlXml_MemStream(XmlDocument xmldoc)
{
  byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(xmldoc.OuterXml);
  MemoryStream ms = new MemoryStream(buffer);
  SqlXml x = new SqlXml(ms);
  return x;
}
