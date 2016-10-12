private static SqlXml CastXmlDoc_SqlXml_XmlTextReader(XmlDocument xmldoc)
{
  byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(xmldoc.OuterXml);
  MemoryStream ms = new MemoryStream(buffer);
  XmlTextReader xr = new XmlTextReader(ms);
  SqlXml x = new SqlXml(xr);
  return x;
}
