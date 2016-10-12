USE AdventureWorks;
GO

CREATE FUNCTION dbo.fn_GetProductPhoto (@ProductID INT, @Thumbnail BIT)
RETURNS VARBINARY(MAX)
AS
BEGIN
  RETURN (
    SELECT CASE @Thumbnail 
        WHEN 1 THEN pp.ThumbNailPhoto
        ELSE pp.LargePhoto 
      END
    FROM Production.Product p
    INNER JOIN Production.ProductProductPhoto ppp
      ON p.ProductID = ppp.ProductID
    INNER JOIN Production.ProductPhoto pp
      ON ppp.ProductPhotoID = pp.ProductPhotoID
    WHERE p.ProductID = @ProductID
  );
END
GO
