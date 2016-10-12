using System;
using System.Data.SqlTypes;
using System.Xml;
using System.IO;
using System.Text;
using System.Xml.Schema;

namespace Apress.Samples
{
    public partial class ValidationDTD
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlBoolean fn_ValidateDTD(SqlString xml)
        {
            SqlBoolean result = new SqlBoolean(true);
            try
            {
                UnicodeEncoding encoder = new UnicodeEncoding();
                byte[] buffer = encoder.GetBytes(xml.Value);
                MemoryStream stream = new MemoryStream(buffer);
                XmlReaderSettings settings = new XmlReaderSettings();
                settings.CloseInput = true;
                settings.ValidationFlags = settings.ValidationFlags | XmlSchemaValidationFlags.ReportValidationWarnings;
                settings.ConformanceLevel = ConformanceLevel.Document;
                settings.ValidationType = ValidationType.DTD;
                settings.ProhibitDtd = false;
                XmlReader reader = XmlReader.Create(stream, settings);
                settings.ValidationEventHandler += new ValidationEventHandler(MyHandler);
                while (reader.Read()) { ; }
            }
            catch (Exception ex)
            {
                result = SqlBoolean.False;
                throw (new Exception(ex.Message));
            }
            return result;
        }

        private static void MyHandler(object sender, ValidationEventArgs e)
        {
            throw (e.Exception);
        }
    }
};

