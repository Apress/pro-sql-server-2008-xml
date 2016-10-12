using System;
using System.Xml;

namespace Apress.Samples
{
    class XmlDocumentExample
    {
        static void Main(string[] args)
        {
            XmlDocument xd = new XmlDocument();
            xd.LoadXml("<?xml version = \"1.0\"?>" +
              "<sales-order>" +
              "  <row id=\"71805\">" +
              "    <order-date>2004-06-01T00:00:00</order-date>" +
              "    <account-number>10-4020-000573</account-number>" +
              "    <order-amounts total-due=\"76535.5524\">" +
              "      <sub-total>69262.9433</sub-total>" +
              "      <freight>1731.5736</freight>" +
              "      <tax-amount>5541.0355</tax-amount>" +
              "    </order-amounts>" +
              "    <contact>" +
              "      <name>" +
              "        <first>Pilar</first>" +
              "        <last>Ackerman</last>" +
              "      </name>" +
              "      <email>pilar1@adventure-works.com</email>" +
              "      <phone>1 (11) 500 555-0132</phone>" +
              "    </contact>" +
              "  </row>" +
              "</sales-order>");
            XmlNodeList xl = xd.SelectNodes("//order-amounts/*");
            foreach (XmlNode xn in xl)
            {
                Console.WriteLine(String.Format("{0} = {1}", xn.Name, xn.InnerText));
            }
        }
    }
}
