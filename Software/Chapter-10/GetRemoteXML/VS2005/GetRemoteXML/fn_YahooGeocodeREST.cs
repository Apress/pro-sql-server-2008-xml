using System.Data.SqlTypes;
using System.Net;
using System.IO;
using System.Text;

namespace Apress.Sample
{
    public partial class UserDefinedFunctions
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlXml fn_YahooGeocodeRest(SqlString location)
        {
            WebClient wc = new WebClient();
            string uri = string.Format("http://local.yahooapis.com/MapsService/V1/geocode" +
              "?appid=YahooDemo&location={0}", location.Value);
            byte[] reqXML = wc.DownloadData(uri);
            MemoryStream ms = new MemoryStream(reqXML);
            return new SqlXml(ms);
        }
    };
}
