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
            XDocument xd = XDocument.Load("c:\\market-summary.xml", LoadOptions.PreserveWhitespace);
            XNamespace ms = "apress:sample:market-summary:urn";

            var query = from node in xd.Elements(ms + "market-summary")
                            .Elements(ms + "index")
                            .Elements("daily-summary")
                        group node by node.Parent.Attribute("symbol") into g
                        select new
                        {
                            Index = g.Key,
                            AverageOpen = g.Average(p => (float)p.Element("open")),
                            AverageClose = g.Average(p => (float)p.Element("close"))
                        };

            foreach (var node in query)
            {
                Console.WriteLine("Date: {0}, Avg Open: {1}, Avg Close: {2}", node.Index, node.AverageOpen, node.AverageClose);
                Console.WriteLine("===========================");
            }
        }
    }
}
