DECLARE @x xml,
  @source nvarchar(200);

SET @source = N'<?xml version = "1.0"?>
<message>
  <to>SQL Server Team</to> 
  <from>Michael Coles</from> 
  <subject>Thanks</subject> 
  <content>Thanks for the new version of SQL Server</content> 
</message>';

/* Explicit conversion to xml */
SET @x = CONVERT(xml, @source, 0);
GO