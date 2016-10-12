DECLARE @g geometry;

SET @g = geometry::GeomFromGml ('<MultiPoint 
  xmlns = "http://www.opengis.net/gml">
  <pointMembers>
    <Point> <!-- Mount McKinley, Alaska -->
      <pos>-151.006347 63.069042</pos>
    </Point>
    <Point> <!-- Mount St. Elias, Alaska -->
      <pos>-140.930741 60.292682</pos>
    </Point>
    <Point> <!-- Mount Foraker, Alaska -->
      <pos>-151.399814 62.960408</pos>
    </Point>
  </pointMembers>
</MultiPoint>', 0);
GO