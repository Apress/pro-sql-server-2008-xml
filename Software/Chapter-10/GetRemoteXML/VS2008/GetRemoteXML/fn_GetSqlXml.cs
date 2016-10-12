using System.Data.SqlTypes;
using System.Net;
using System.IO;
using System.Text; 
using System.Xml;

namespace Apress.Sample
{
    public partial class UserDefinedFunctions
    {
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


        private static XmlDocument CastSqlXmlToXmlDocument(SqlXml xml)
        {
            XmlDocument xd = new XmlDocument();
            if (!xml.IsNull)
            {
                xd.Load(xml.CreateReader());
            }
            else
            {
                xd = null;
            }
            return xd;
        }

        private static XmlDocument CastSqlXmlToXmlDocument2(SqlXml xml)
        {
            XmlDocument xd = new XmlDocument();
            byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(xml.Value);
            MemoryStream ms = new MemoryStream(buffer);
            xd.Load(ms);
            return xd;
        }

        private static SqlXml CastXmlDocumentToSqlXml(XmlDocument xmldoc)
        {
            byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(xmldoc.OuterXml);
            MemoryStream ms = new MemoryStream(buffer);
            XmlTextReader xr = new XmlTextReader(ms);
            SqlXml x = new SqlXml(xr);
            return x;
        }

        private static SqlXml CastXmlDocumentToSqlXml2(XmlDocument xmldoc)
        {
            byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(xmldoc.OuterXml);
            MemoryStream ms = new MemoryStream(buffer);
            SqlXml x = new SqlXml(ms);
            return x;
        }

        [Microsoft.SqlServer.Server.SqlFunction]
        public static int fn_GetSqlXml(SqlXml xml)
        {
            XmlDocument xd = CastSqlXmlToXmlDocument2(xml);
            SqlXml x = CastXmlDocumentToSqlXml2(xd);
            return 1;
        }
    };
}
