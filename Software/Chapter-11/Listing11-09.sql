DECLARE @g geometry;

SET @g = geometry::GeomFromGml(N'<Polygon
  xmlns="http://www.opengis.net/gml">
  <exterior>
    <LinearRing>
      <posList>0 0 4 0 4 3 2 5 0 2 0 0</posList>
    </LinearRing>
  </exterior>
  <interior>
    <LinearRing>
      <posList>2 1 3 3 1 2 2 1</posList>
    </LinearRing>
  </interior>
</Polygon>', 0);
GO