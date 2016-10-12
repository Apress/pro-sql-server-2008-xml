using System;
using System.Data.SqlClient;
using System.Xml;
using System.IO;

namespace Apress.Samples
{
    class AsyncExecuteXmlReader_Example
    {

        static void Main(string[] args)
        {
            string constr = "SERVER=SQL2008;INITIAL CATALOG=AdventureWorks;" +
                "INTEGRATED SECURITY=false;USER=sa;PASSWORD=1qaz1qaz;ASYNCHRONOUS PROCESSING=true;";
            string cmdstr = "SELECT TOP (3) * " +
                "FROM Production.Product " +
                "FOR XML AUTO, ELEMENTS, ROOT('root');";
            Console.WriteLine("Async Call Start...");
            RunAsync(cmdstr, constr);
            Console.WriteLine("Async Call End...");
            Console.WriteLine("=== Press any key to end... ===");
            Console.ReadKey(false);
        }

        static private void RunAsync(string cmdstr, string constr)
        {
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                sqlcon.Open();
                using (SqlCommand sqlcmd = new SqlCommand(cmdstr, sqlcon))
                {
                    IAsyncResult result = sqlcmd.BeginExecuteXmlReader();
                    int count = 0;
                    while (!result.IsCompleted)
                    {
                        Console.WriteLine("Waiting... ({0})", count++);
                        System.Threading.Thread.Sleep(1);
                    }
                    XmlReader xr = sqlcmd.EndExecuteXmlReader(result);
                    ShowXml(xr);  
                }
            }
        }

        private static void ShowXml(XmlReader xr)
        {
            XmlDocument xd = new XmlDocument();
            xd.Load(xr);
            Console.WriteLine(xd.OuterXml);
        }
    }
}
