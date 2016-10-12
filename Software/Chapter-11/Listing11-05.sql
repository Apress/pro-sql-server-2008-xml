DECLARE @g geometry;

SET @g = geometry::GeomFromGml ('<Point 
  xmlns = "http://www.opengis.net/gml"> <!-- Mount McKinley, Alaska -->
  <pos>-151.006347 63.069042</pos>
</Point>', 0);
GO