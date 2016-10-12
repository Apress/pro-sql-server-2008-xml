using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Apress.Samples
{
    class Linq_Transform_Xml_Example
    {
        static void Main(string[] args)
        {
            XDocument xml = XDocument.Load("c:\\market-summary.xml");
            XNamespace ms = "apress:sample:market-summary:urn";

            var query = from node in xml.Elements(ms + "market-summary")
                            .Elements(ms + "index")
                            .Elements("daily-summary")
                        select new XElement("summary", 
                                    new XAttribute("symbol", node.Parent.Attribute("symbol").Value),
                                    new XAttribute("date", node.Element("date").Value),
                                    new XAttribute("open", node.Element("open").Value),
                                    new XAttribute("high", node.Element("high").Value),
                                    new XAttribute("low", node.Element("low").Value),
                                    new XAttribute("close", node.Element("close").Value),
                                    new XAttribute("volume", node.Element("volume").Value),
                                    new XAttribute("adjusted-close", node.Element("adjusted-close").Value)
                               );

            foreach (var x in query)
            {
                Console.WriteLine(x.ToString());
            }
        }
    }
}
