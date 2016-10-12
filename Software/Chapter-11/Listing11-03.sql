DECLARE @Delaware geometry;

SET @Delaware = geometry::GeomFromGml(N'<gml:Polygon xmlns:gml="http://www.opengis.net/gml">
  <gml:exterior>
    <gml:LinearRing>
      <gml:posList>
        -75.70742 38.557476 -75.71106 38.649551 -75.724937 38.83017 
        -75.752922 39.141548 -75.761658 39.247753 -75.764664 39.295849 
        -75.772697 39.383007 -75.791435 39.723755 -75.775269 39.724442 
        -75.745934 39.774818 -75.695114 39.820347 -75.644341 39.838196 
        -75.583794 39.840008 -75.470345 39.826435 -75.42083 39.79887 
        -75.412117 39.789658 -75.428009 39.77813 -75.460754 39.763248 
        -75.475128 39.741718 -75.476334 39.719971 -75.489639 39.714745 
        -75.610725 39.612793 -75.562996 39.566723 -75.590187 39.463768 
        -75.515572 39.36694 -75.402481 39.257637 -75.397728 39.073036 
        -75.324852 39.012386 -75.307899 38.945911 -75.190941 38.80867 
        -75.083138 38.799812 -75.045998 38.44949 -75.068298 38.449963 
        -75.093094 38.450451 -75.350204 38.455208 -75.69915 38.463066 
        -75.70742 38.557476
      </gml:posList>
    </gml:LinearRing>
  </gml:exterior>
</gml:Polygon>', 0);

DECLARE @DelawareStateCapitol geometry, 
  @LibertyBell geometry;
	 
SET @DelawareStateCapitol = Geometry::GeomFromGml(N'<gml:Point 
  xmlns:gml = "http://www.opengis.net/gml">
  <gml:pos>-75.522864 39.156473</gml:pos>
</gml:Point>', 0);

SET @LibertyBell = Geometry::GeomFromGml(N'<gml:Point 
  xmlns:gml = "http://www.opengis.net/gml">
  <gml:pos>-75.15028 39.95028</gml:pos>
</gml:Point>', 0);

SELECT 'DE Contains DE State Capitol' AS [Desc], @Delaware.STContains(@DelawareStateCapitol) AS Flag
UNION
SELECT 'DE Contains Liberty Bell', @Delaware.STContains(@LibertyBell);