using System.Data.SqlTypes;
using System.Net;
using System.IO;
using System.Text;

namespace Apress.Sample
{
    public partial class UserDefinedFunctions
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlXml fn_GetRemoteXML(SqlString uri)
        {
            WebClient wc = new WebClient();
            byte[] reqXML = wc.DownloadData(uri.Value);
            MemoryStream ms = new MemoryStream(reqXML);
            return new SqlXml(ms);
        }
    };
}

