private static XmlDocument CastSqlXml_XmlDoc_Reader(SqlXml xml)
{
  XmlDocument xd = new XmlDocument();
  xd.Load(xml.CreateReader());
  return xd;
}
