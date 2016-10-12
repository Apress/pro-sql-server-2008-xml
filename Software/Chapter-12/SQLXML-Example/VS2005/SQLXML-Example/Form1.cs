using System;
using System.IO;
using System.Collections;
using System.Windows.Forms;
using Microsoft.Data.SqlXml;
using System.Data.SqlClient;

namespace Apress.Samples
{
    public partial class Form1 : Form
    {

        string SqlXmlConnString = "Provider=SQLOLEDB;" +
            "Server=(local);" +
            "database=AdventureWorks;" +
            "Integrated Security=SSPI";

        Hashtable Updategrams = new Hashtable(3);

        public Form1()
        {
            InitializeComponent();

            Updategrams.Add("Insert", "<?xml version=\"1.0\"?> " +
                "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
                "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
                "<updg:sync mapping-schema=\"c:\\contactupdg.xsd\"> " +
                "<updg:before> " +
                "</updg:before> " +
                "<updg:after> " +
                "<Contact id=\"20000\" last-name=\"Braff\" first-name=\"Zach\" " +
                "email=\"zbraff@adventure-works.com\" phone=\"942-555-2439\"  " +
                "promotion=\"0\" name-style=\"0\" password-hash=\"ZEgQH9qZIPiLgyBHYw/dD1FJQNpdQyIAa+BFfKX5/jg=\" " +
                "password-salt=\"7iy/umc=\"/> " +
                "</updg:after> " +
                "</updg:sync>" +
                "</ROOT>");

            Updategrams.Add("Update", "<?xml version=\"1.0\"?> " +
                "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
                "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
                "<updg:sync mapping-schema=\"c:\\contactupdg.xsd\"> " +
                "<updg:before> " +
                "<Contact id=\"20000\" /> " +
                "</updg:before> " +
                "<updg:after>" +
                "<Contact id=\"20000\" last-name=\"Braff\" first-name=\"Zachary\" />" +
                "</updg:after> " +
                "</updg:sync> " +
                "</ROOT>");

            Updategrams.Add("Delete", "<?xml version=\"1.0\"?> " +
                "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
                "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
                "<updg:sync mapping-schema=\"c:\\contactupdg.xsd\"> " +
                "<updg:before> " +
                "<Contact id=\"20000\" last-name=\"Braff\" first-name=\"Zachary\" /> " +
                "</updg:before> " +
                "<updg:after>" +
                "</updg:after> " +
                "</updg:sync> " +
                "</ROOT>");

        }

        private void btnQuery_Click(object sender, EventArgs ea)
        {
            SqlXmlCommand cmd = new SqlXmlCommand(SqlXmlConnString);
            cmd.CommandText = "EXEC dbo.uspGetEmployeeManagers ? " +
                "FOR XML NESTED";
            cmd.ClientSideXml = true;

            SqlXmlParameter p;
            p = cmd.CreateParameter();
            p.Value = txtEmployeeId.Text;

            try
            {
                Stream strm = cmd.ExecuteStream();
                strm.Position = 0;
                using (StreamReader sr = new StreamReader(strm))
                {
                    txtResult.Text = sr.ReadToEnd();
                }
            }
            catch (SqlXmlException e)
            {
                System.Console.WriteLine(e.Message);
            }
        }

        private void CreateBulkLoadTable()
        {
            SqlConnection con = new SqlConnection("SERVER=(local);INITIAL CATALOG=AdventureWorks;INTEGRATED SECURITY=SSPI;");
            con.Open();
            SqlCommand cmd = new SqlCommand("IF OBJECT_ID('Sales.CustomerGeography') IS NOT NULL " +
                "DROP TABLE Sales.CustomerGeography;" +
                "CREATE TABLE Sales.CustomerGeography (CustomerID INT NOT NULL PRIMARY KEY, " +
                "Latitude NUMERIC (15, 6), " +
                "Longitude NUMERIC (15, 6), " +
                "Resolution VARCHAR(20)) ", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Dispose();
        }

        [STAThread()]
        private void BulkLoadData()
        {
            SQLXMLBULKLOADLib.SQLXMLBulkLoad4Class bulkloader = new SQLXMLBULKLOADLib.SQLXMLBulkLoad4Class();
            bulkloader.ConnectionString = SqlXmlConnString;
            bulkloader.ErrorLogFile = "c:\\bulkloaderrors.xml";
            bulkloader.KeepIdentity = false;
            bulkloader.Transaction = false;
            bulkloader.Execute("c:\\AWCustGeo.xsd", "c:\\AWCustGeo.xml");
        }

        private void btnBulkLoad_Click(object sender, EventArgs ea)
        {
            try
            {
                CreateBulkLoadTable();
                BulkLoadData();
                txtStatus.Text = "Finished Successfully!";
            }
            catch (Exception e)
            {
                txtStatus.Text = e.Message;
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnInsertUpdateDelete_Click(object sender, EventArgs ea)
        {
            try
            {
                SqlXmlCommand cmd = new SqlXmlCommand(SqlXmlConnString);
                cmd.CommandType = SqlXmlCommandType.UpdateGram;
                cmd.RootTag = "ROOT";

                cmd.CommandText = Updategrams[btnInsertUpdateDelete.Text].ToString();
                txtResult.Text = Updategrams[btnInsertUpdateDelete.Text].ToString();

                cmd.ExecuteNonQuery();

                switch (btnInsertUpdateDelete.Text)
                {
                    case "Insert":
                        txtStatus2.Text = "Row Inserted";
                        btnInsertUpdateDelete.Text = "Update";
                        break;
                    case "Update":
                        txtStatus2.Text = "Row Updated";
                        btnInsertUpdateDelete.Text = "Delete";
                        break;
                    case "Delete":
                        txtStatus2.Text = "Row Deleted";
                        btnInsertUpdateDelete.Text = "Insert";
                        break;
                }
            }
            catch (Exception e)
            {
                txtStatus2.Text = e.Message;
            }
        }
    }
}