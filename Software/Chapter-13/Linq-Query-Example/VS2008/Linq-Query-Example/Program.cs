using System;
using System.IO;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Linq;

namespace Apress.Samples
{
    class Linq_Query_Example
    {
        static void Main(string[] args)
        {
            XDocument xd = XDocument.Load("c:\\market-summary.xml", 
                LoadOptions.PreserveWhitespace);
            XNamespace ms = "apress:sample:market-summary:urn";

            var query = from node in xd.Elements(ms + "market-summary")
                            .Elements(ms + "index")
                            .Elements("daily-summary")
                        where (DateTime)node.Element("date") >= DateTime.Parse("2008-01-10T05:00:00Z")
                        orderby (DateTime)node.Element("date"),
                            (string)node.Parent.Attribute("symbol")
                        select node;

            foreach (var node in query)
            {
                Console.WriteLine("Date: {0} Index: {1} ",
                    node.Element("date").Value,
                    node.Parent.Attribute("symbol").Value);
                Console.WriteLine("Open: {0} High: {1} Low: {2}",
                    node.Element("open").Value,
                    node.Element("high").Value,
                    node.Element("low").Value);
                Console.WriteLine("==============================");
            }
        }
    }
}
