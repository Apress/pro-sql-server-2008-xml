using System;
using System.IO;
using System.Xml;
using System.Linq;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Apress.Samples 
{
    class Linq_Db_Xml_Example2
    {
        static void Main(string[] args)
        {
            AdventureWorksDataContext db = new AdventureWorksDataContext();

            db.Log = Console.Out;

            var JobCandidates = from JobCandidate in db.JobCandidates
                                where JobCandidate.JobCandidateID == 1
                                select JobCandidate;

            foreach (var JobCandidate in JobCandidates)
            {
                XElement xml = JobCandidate.Resume;
                Console.WriteLine(xml.ToString());
            }
        }
    }
}
