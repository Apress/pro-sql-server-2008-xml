using System.Data.SqlTypes;
using System.Net;
using System.IO;
using System.Text;

namespace Apress.Sample
{
    public partial class UserDefinedFunctions
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlXml fn_eBaySearchREST(SqlString keywords)
        {
            WebClient wc = new WebClient();
            string appid = "Apressadf-21df-452a-9ee4-b69135f32c9"; // Replace this with your own appid
            string uri = string.Format("http://open.api.ebay.com/shopping?callname=FindItems&" +
              "QueryKeywords={0}&appid={1}&version=517&MaxEntries=50", keywords.Value, appid);
            byte[] reqXML = wc.DownloadData(uri);
            MemoryStream ms = new MemoryStream(reqXML);
            return new SqlXml(ms);
        }
    };
}

