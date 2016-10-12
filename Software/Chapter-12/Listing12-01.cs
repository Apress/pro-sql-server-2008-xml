    string SqlXmlConnString = "Provider=SQLOLEDB;" +
        "Server=(local);" +
        "Database=AdventureWorks;" +
        "Integrated Security=SSPI";

    private void btnQuery_Click(object sender, EventArgs ev)
    {
        SqlXmlCommand cmd = new SqlXmlCommand(SqlXmlConnString);
        cmd.CommandText = "EXEC dbo.uspGetEmployeeManagers ? " +
            "FOR XML NESTED";
        cmd.ClientSideXml = true;

        SqlXmlParameter p;
        p = cmd.CreateParameter();
        p.Value = txtContactID.Text;

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
            e.ErrorStream.Position = 0;
            string s = new StreamReader(e.ErrorStream).ReadToEnd();
            System.Console.WriteLine(s);
        }
    }
