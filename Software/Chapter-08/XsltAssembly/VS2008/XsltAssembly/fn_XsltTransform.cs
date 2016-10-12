using System.Data.SqlTypes;

namespace Apress.Samples
{
    public partial class XsltAssembly
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlXml fn_XsltTransform(SqlXml source_xml,
            SqlXml source_xslt)
        {
            SqlXml result = new SqlXml();
            if (source_xml.IsNull ||
                source_xslt.IsNull)
                result = SqlXml.Null;
            else
                result = Transform(source_xml, source_xslt);
            return result;
        }
    };
}