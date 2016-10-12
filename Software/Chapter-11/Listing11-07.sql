DECLARE @g geometry;

SET @g = geometry::GeomFromGml ('<LineString 
  xmlns = "http://www.opengis.net/gml">
  <!-- Straight line from Philadelphia to Trenton to New York City -->
  <posList>-75.25 39.88 -74.82 40.28 -73.98 40.77</posList>
</LineString>', 0);
GO