[STAThread()]
private void BulkLoadData()
{
  SQLXMLBULKLOADLib.SQLXMLBulkLoad4Class bulkloader = 
    new SQLXMLBULKLOADLib.SQLXMLBulkLoad4Class();
  bulkloader.ConnectionString = SqlXmlConnString;
  bulkloader.ErrorLogFile = "c:\\bulkloaderrors.xml";
  bulkloader.KeepIdentity = false;
  bulkloader.Transaction = false;
  bulkloader.Execute("c:\\AWCustGeo.xsd", "c:\\AWCustGeo.xml");
}
