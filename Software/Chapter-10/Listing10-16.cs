private static XmlDocument CastSqlXml_XmlDoc_MemStream(SqlXml xml)
{
  XmlDocument xd = new XmlDocument();
  byte[] buffer = UTF8Encoding.UTF8.GetBytes(xml.Value);
  MemoryStream ms = new MemoryStream(buffer);
  xd.Load(ms);
  return xd;
}
