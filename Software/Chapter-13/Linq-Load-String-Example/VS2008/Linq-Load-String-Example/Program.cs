using System;
using System.Xml.Linq;

namespace Apress.Samples
{
    class Linq_Load_String_Example
    {
        static void Main(string[] args)
        {
            XDocument xd = XDocument.Parse("<ms:market-summary xmlns:ms=\"apress:sample:market-summary:urn\">" +
                "<ms:index symbol=\"DJIA\" name=\"Dow Jones Industrial Average\">" +
                "<daily-summary>" +
                "<date>2008-01-11T05:00:00Z</date>" +
                "<open>12850.74</open>" +
                "<high>12863.34</high>" +
                "<low>12495.91</low>" +
                "<close>12606.3</close>" +
                "<volume>4495840000</volume>" +
                "<adjusted-close>12606.3</adjusted-close>" +
                "</daily-summary>" +
                "</ms:index>" +
                "</ms:market-summary>");

            Console.WriteLine(xd.ToString());
        }
    }
}
