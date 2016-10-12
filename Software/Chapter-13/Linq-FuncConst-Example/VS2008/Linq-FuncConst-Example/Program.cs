using System;
using System.Xml.Linq;

namespace Apress.Samples
{
    class Linq_FuncConst_Example
    {
        static void Main(string[] args)
        {
            XElement market_summary = new XElement("market-summary",
                new XElement("index",
                    new XAttribute("symbol", "DJIA"),
                    new XAttribute("name", "Dow Jones Industrial Average"),
                    new XElement("daily-summary",
                        new XElement("date", "2008-01-11T05:00:00Z"),
                        new XElement("open", "12850.74"),
                        new XElement("high", "12863.34"),
                        new XElement("low", "12495.91"),
                        new XElement("close", "12606.30"),
                        new XElement("volume", "4495840000"),
                        new XElement("adjusted-close", "12606.30")
                        )
                    )
                );
            Console.WriteLine(market_summary.ToString());
        }
    }
}
