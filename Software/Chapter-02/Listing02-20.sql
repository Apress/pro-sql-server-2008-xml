USE AdventureWorks;
GO
EXEC dbo.uspGetBillOfMaterials @StartProductID = 749,
  @CheckDate = N'2007-09-02';
GO
