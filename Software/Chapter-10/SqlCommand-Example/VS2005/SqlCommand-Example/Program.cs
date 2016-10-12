using System;
using System.Data.SqlClient;
using System.Xml;
using System.IO;

namespace Apress.Samples
{
    class ExecuteXmlReader_Example
    {
        static void Main(string[] args)
        {
            string constr = "SERVER=SQL2008;INITIAL CATALOG=AdventureWorks;INTEGRATED SECURITY=false;USER=sa;PASSWORD=1qaz1qaz;";
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                sqlcon.Open();
                using (SqlCommand sqlcmd = new SqlCommand("SELECT TOP (3) * FROM Production.Product FOR XML AUTO, ELEMENTS, ROOT('root');", sqlcon))
                {
                    using (XmlReader xr = sqlcmd.ExecuteXmlReader())
                    {                        
                        XmlDocument xd = new XmlDocument();
                        xd.Load(xr);
                        Console.WriteLine(xd.OuterXml);
                    }
                }
            }
            Console.WriteLine("=== Press any key to end... ===");
            Console.ReadKey(false);
        }
    }
}
