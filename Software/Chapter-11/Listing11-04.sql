DECLARE @point geometry,
  @multipoint geometry,
  @linestring geometry,
  @multilinestring geometry,
  @polygon geometry,
  @multipolygon geometry,
  @multigeometry geometry;

/* Defining a Point */
SET @point = geometry::GeomFromGml(N'<Point 
  xmlns="http://www.opengis.net/gml">
  <pos>0.5 1.0</pos>
</Point>', 0);

/* Defining a MultiPoint */
SET @multipoint = geometry::GeomFromGml('<MultiPoint 
  xmlns="http://www.opengis.net/gml">
  <pointMembers>
    <Point>
      <pos>4.5 2</pos>
    </Point>
    <Point>
      <pos>5 2</pos>
    </Point>
    <Point>
      <pos>5 2.5</pos>
    </Point>
  </pointMembers>
</MultiPoint>', 0);

/* Defining a LineString */
SET @linestring = geometry::GeomFromGml(N'<LineString 
  xmlns="http://www.opengis.net/gml">
  <posList>2.0 0.0 3.0 1.0</posList>
</LineString>', 0);

/* Defining a MultiLineString */
SET @multilinestring = geometry::GeomFromGml('<MultiCurve 
  xmlns="http://www.opengis.net/gml">
  <curveMembers>
    <LineString>
      <posList>3.5 4 3.5 3.5</posList>
    </LineString>
    <LineString>
      <posList>3.5 3.5 4 3</posList>
    </LineString>
  </curveMembers>
</MultiCurve>', 0);

/* Defining a Polygon */
SET @polygon = geometry::GeomFromGml(N'<Polygon
  xmlns="http://www.opengis.net/gml">
  <exterior>
    <LinearRing>
      <posList>0.5 1.0 1.0 1.0 2.0 1.5 1.0 2.5 0.5 1.0</posList>
    </LinearRing>
  </exterior>
</Polygon>', 0);

/* Defining a MultiPolygon */
SET @multipolygon = geometry::GeomFromGml(N'<MultiSurface
  xmlns="http://www.opengis.net/gml">
  <surfaceMembers>
    <Polygon>
      <exterior>
        <LinearRing>
          <posList>1 3.5 1.5 3.5 2 4 1.5 4 1 3.5</posList>
        </LinearRing>
      </exterior>
    </Polygon>
    <Polygon>
      <exterior>
        <LinearRing>
          <posList>0 3.5 0.5 3.5 1 4 0.5 4 0 3.5</posList>
        </LinearRing>
      </exterior>
    </Polygon>
  </surfaceMembers>
</MultiSurface>', 0);

/* Defining a MultiGeometry containing a Polygon and MultiPoint */
SET @multigeometry = geometry::GeomFromGml('<MultiGeometry 
  xmlns="http://www.opengis.net/gml">
  <geometryMembers>
    <Polygon>
      <exterior>
        <LinearRing>
          <posList>1 3.5 1.5 3.5 2 4 1.5 4 1 3.5</posList>
        </LinearRing>
      </exterior>
    </Polygon>
    <Polygon>
      <exterior>
        <LinearRing>
          <posList>0 3.5 0.5 3.5 1 4 0.5 4 0 3.5</posList>
        </LinearRing>
      </exterior>
    </Polygon>
    <MultiPoint>
      <pointMembers>
        <Point>
          <pos>5 2.5</pos>
        </Point>
        <Point>
          <pos>5 2</pos>
        </Point>
        <Point>
          <pos>4.5 2</pos>
        </Point>
      </pointMembers>
    </MultiPoint>
  </geometryMembers>
</MultiGeometry>', 0);
GO