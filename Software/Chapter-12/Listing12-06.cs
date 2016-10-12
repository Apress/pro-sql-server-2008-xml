// The SqlXmlConnString is the SQLXML connection string
string SqlXmlConnString = "Provider=SQLOLEDB;" +
  "Server=(local);" +
  "database=AdventureWorks;" +
  "Integrated Security=SSPI";

// The Updategrams hashtable contains all three sample updategrams,
// the sample Insert updategram, sample Update updategram, and sample
// Delete updategram.
Hashtable Updategrams = new Hashtable(3);

...

// The sample updategrams are added to the hashtable below
Updategrams.Add("Insert", "<?xml version=\"1.0\"?> " +
  "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
  "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
  ...
  "</ROOT>");

Updategrams.Add("Update", "<?xml version=\"1.0\"?> " +
  "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
  "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
  ...
  "</ROOT>");

Updategrams.Add("Delete", "<?xml version=\"1.0\"?> " +
  "<ROOT xmlns:sql=\"urn:schemas-microsoft-com:xml-sql\" " +
  "xmlns:updg=\"urn:schemas-microsoft-com:xml-updategram\"> " +
  ...
  "</ROOT>");

...

SqlXmlCommand cmd = new SqlXmlCommand(SqlXmlConnString);
cmd.CommandType = SqlXmlCommandType.UpdateGram;
cmd.RootTag = "ROOT";

cmd.CommandText = Updategrams[btnInsertUpdateDelete.Text].ToString();
txtResult.Text = Updategrams[btnInsertUpdateDelete.Text].ToString();
cmd.ExecuteNonQuery();
