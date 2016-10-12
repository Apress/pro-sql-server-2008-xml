using System.Data.SqlTypes;
using System.Xml;
using System.IO;

/* The content of this file is also included in the XsltAssembly solution which is
   located in the XsltAssembly directory. */

namespace Apress.Samples
{
    public partial class XsltAssembly
    {
        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void p_XsltTransformToFile(SqlXml source_xml,
            SqlXml source_xslt,
            SqlString output_file)
        {
            SqlXml result = new SqlXml();
            if (!source_xml.IsNull &&
                !source_xslt.IsNull &&
                !output_file.IsNull)
            {
                result = Transform(source_xml, source_xslt);
                StreamWriter sw = new StreamWriter(output_file.Value);
                sw.Write(result.Value);
                sw.Dispose();
            }
        }
    };
}