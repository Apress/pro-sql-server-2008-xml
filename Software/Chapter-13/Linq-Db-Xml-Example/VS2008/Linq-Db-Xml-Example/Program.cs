using System;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Xml;

namespace Apress.Samples
{
    class Linq_Db_Xml_Example
    {
        static void Main(string[] args)
        {
            XElement xml;
            string constr = "SERVER=SQL2008;INITIAL CATALOG=AdventureWorks;" +
                "INTEGRATED SECURITY=false;USER=sa;PASSWORD=1qaz1qaz;";
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                sqlcon.Open();
                using (SqlCommand sqlcmd = new SqlCommand("SELECT Resume " +
                    "FROM HumanResources.JobCandidate " +
                    "WHERE JobCandidateId = 1;", sqlcon))
                {
                    using (XmlReader xr = sqlcmd.ExecuteXmlReader())
                    {
                        xml = XElement.Load(xr, LoadOptions.PreserveWhitespace);
                    }
                }
            }
            Console.WriteLine(xml.ToString()); 
        }
    }
}
