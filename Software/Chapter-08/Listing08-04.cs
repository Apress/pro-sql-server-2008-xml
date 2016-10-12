using System.Data.SqlTypes;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.IO;

/* This content of this file is also part of the XsltAssembly SQLCLR solution in the
   XsltAssembly directory. */

namespace Apress.Samples
{
    public partial class XsltAssembly
    {
        // Create an XML Reader from an XmlDocument string

        private static XmlReader CreateXmlReader(SqlXml source_xml)
        {
            byte[] xmldata = Encoding.UTF8.GetBytes(source_xml.Value);
            MemoryStream stream = new MemoryStream(xmldata);
            return XmlReader.Create(stream);
        }

        private static XslCompiledTransform CreateXsltStylesheet (SqlXml source_xslt)
        {
            XslCompiledTransform xslt_stylesheet = new XslCompiledTransform();
            xslt_stylesheet.Load(CreateXmlReader(source_xslt));
            return xslt_stylesheet;
        }

        private static MemoryStream ApplyStylesheet(XmlReader source_xml_reader, 
            XslCompiledTransform xslt_stylesheet)
        {
            MemoryStream buffer = new MemoryStream();
            StreamWriter stream = new StreamWriter(buffer);
            xslt_stylesheet.Transform(source_xml_reader, XmlWriter.Create(stream));
            return buffer;
        }

        private static SqlXml Transform(SqlXml source_xml, 
            SqlXml source_xslt)
        {

            XmlReader source_xml_reader = CreateXmlReader(source_xml);
            XslCompiledTransform xslt_stylesheet = CreateXsltStylesheet(source_xslt);
            return new SqlXml(ApplyStylesheet(source_xml_reader, xslt_stylesheet));
        }
    }
}
