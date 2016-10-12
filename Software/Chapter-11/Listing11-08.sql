DECLARE @g geometry;

SET @g = geometry::GeomFromGml('<MultiCurve 
  xmlns = "http://www.opengis.net/gml">
  <curveMembers>
    <LineString> <!-- Trenton to New York City -->
      <posList>-74.82 40.28 -73.98 40.77</posList>
    </LineString>
    <LineString> <!-- Phildelphia to Pittsburgh -->
      <posList>-75.25 39.88 -80.22 40.50</posList>
    </LineString>
  </curveMembers>
</MultiCurve>', 0);
GO