USE AdventureWorks;
GO
SELECT p.ProductID AS "Prodcut/@ID",
  p.Name AS "Product/Name",
  p.ProductNumber AS "Product/Number",
  p.Color AS "Product/processing-instruction(color-scheme)",
  CASE pp.LargePhotoFileName
      WHEN 'no_image_available_large.gif' THEN 'No-Image'
      ELSE 'Show-Image' 
      END AS "Product/processing-instruction(display-style)",
  pp.LargePhotoFileName AS "Product/Photo"
FROM Production.Product p
INNER JOIN Production.ProductProductPhoto ppp
  ON p.ProductID = ppp.ProductID
INNER JOIN Production.ProductPhoto pp
  ON ppp.ProductPhotoID = pp.ProductPhotoID
WHERE p.ProductID IN ( 716, 717 )
  FOR XML PATH;
GO