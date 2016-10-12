USE AdventureWorks;
GO
SELECT ProductPhotoID,
  ThumbNailPhoto,
  ThumbnailPhotoFileName
FROM Production.ProductPhoto
WHERE ProductPhotoID = 1
FOR XML RAW,
  ELEMENTS, 
  BINARY BASE64;
GO