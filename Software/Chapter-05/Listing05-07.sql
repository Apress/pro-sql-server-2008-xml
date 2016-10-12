DECLARE @x xml;

SELECT @x = N'
<Geocode-Results>
  <Result Name = "Microsoft Corp.">
    <Address>Microsoft Way</Address> 
    <City>Redmond</City> 
    <State>WA</State> 
    <Zip>98052</Zip> 
    <Latitude>47.643727</Latitude> 
    <Longitude>-122.130474</Longitude> 
  </Result>
  <Result Name = "Apple Inc.">
    <Address>1 Infinite Loop</Address> 
    <City>Cupertino</City> 
    <State>CA</State> 
    <Zip>95014</Zip> 
    <Latitude>37.332315</Latitude> 
    <Longitude>-122.030749</Longitude> 
  </Result>
</Geocode-Results>
';

SELECT @x.query('/Geocode-Results/Result[@Name eq "Apple Inc."]');
GO
