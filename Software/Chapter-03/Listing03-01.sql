DECLARE @imp_x xml,
  @exp_x xml,
  @source nvarchar(200);

SET @source = N'<?xml version = "1.0"?>
<message>
  <to>SQL Server Team</to> 
  <from>Michael Coles</from> 
  <subject>Thanks</subject> 
  <content>Thanks for the new version of SQL Server</content> 
</message>';

/* Implicit conversion to xml */
SET @imp_x = @source;

/* Explicit conversion to xml */
SET @exp_x = CAST(@source AS xml);
GO