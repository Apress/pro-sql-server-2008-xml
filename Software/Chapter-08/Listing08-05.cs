using System.Data.SqlTypes;

/* The content of this file is also included in the XsltAssembly solution which is
   located in the XsltAssembly directory */

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