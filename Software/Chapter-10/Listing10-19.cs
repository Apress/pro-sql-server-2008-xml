private static XmlDocument CastSqlXml_XmlDoc(SqlXml xml)
{
  XmlDocument xd = new XmlDocument();
  if (xml.IsNull)
  {
    xd = null;
  }
  else
  {
    xd.Load(xml.CreateReader());
  }
  return xd;
}
