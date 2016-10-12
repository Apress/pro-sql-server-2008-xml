using System;
using System.Xml.Linq;

namespace Apress.Samples
{
    class Linq_Load_Example
    {
        static void Main(string[] args)
        {
            XDocument xd = XDocument.Load("c:\\market-summary.xml", LoadOptions.PreserveWhitespace);
            Console.WriteLine(xd.ToString());
        }
    }
}
