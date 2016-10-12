using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Apress.Samples
{
    class Linq_Rss_Xml_Example
    {
        static void Main(string[] args)
        {
            XDocument rss = XDocument.Load(@"http://www.sqlservercentral.com/Xml/Rss/Articles/SQL+Server+2008");
            
            var rssfeed = from item in rss.Elements("rss")
                              .Elements("channel")
                              .Elements("item")
                          select new {
                              title = item.Element("title").Value,
                              description = item.Element("description").Value,
                              guid = item.Element("guid").Value,
                              pubDate = item.Element("pubDate").Value,
                              link = item.Element("link").Value
                          };

            foreach (var item in rssfeed)
            {
                Console.WriteLine("title: {0}\nguid: {1}\npub. date: {2}\nlink: {3}\ndecscription: {4}",
                    item.title,
                    item.guid,
                    item.pubDate,
                    item.link,
                    item.description);
                Console.WriteLine("============================");
            }
        }
    }
}
