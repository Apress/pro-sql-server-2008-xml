DECLARE @xml xml, 
	@xslt xml;
	
SET @xml = N'<items>
  <item id="749" number="BK-R93R-62">
    <name>Road-150 Red, 62</name>
    <color>Red</color>
    <list-price>3578.2700</list-price>
    <quantity>1.00</quantity>
    <size>62</size>
    <unit-of-measure>CM </unit-of-measure>
    <item id="519" number="SA-R522">
      <name>HL Road Seat Assembly</name>
      <list-price>196.9200</list-price>
      <quantity>1.00</quantity>
      <item id="497" number="PB-6109">
        <name>Pinch Bolt</name>
        <list-price>0.0000</list-price>
        <quantity>4.00</quantity>
      </item>
      <item id="528" number="SL-0931">
        <name>Seat Lug</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="530" number="SP-2981">
        <name>Seat Post</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="913" number="SE-R995">
        <name>HL Road Seat/Saddle</name>
        <list-price>52.6400</list-price>
        <quantity>1.00</quantity>
      </item>
    </item>
    <item id="717" number="FR-R92R-62">
      <name>HL Road Frame - Red, 62</name>
      <color>Red</color>
      <list-price>1431.5000</list-price>
      <quantity>1.00</quantity>
      <size>62</size>
      <unit-of-measure>CM </unit-of-measure>
      <item id="324" number="CS-2812">
        <name>Chain Stays</name>
        <list-price>0.0000</list-price>
        <quantity>2.00</quantity>
        <item id="486" number="MS-2341">
          <name>Metal Sheet 5</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="325" number="DC-8732">
        <name>Decal 1</name>
        <list-price>0.0000</list-price>
        <quantity>2.00</quantity>
      </item>
      <item id="326" number="DC-9824">
        <name>Decal 2</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="327" number="DT-2377">
        <name>Down Tube</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="483" number="MS-1256">
          <name>Metal Sheet 3</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="399" number="HT-8019">
        <name>Head Tube</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="485" number="MS-2259">
          <name>Metal Sheet 4</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="493" number="PA-361R">
        <name>Paint - Red</name>
        <list-price>0.0000</list-price>
        <quantity>8.00</quantity>
      </item>
      <item id="532" number="SS-2985">
        <name>Seat Stays</name>
        <list-price>0.0000</list-price>
        <quantity>4.00</quantity>
        <item id="484" number="MS-1981">
          <name>Metal Sheet 7</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="533" number="ST-9828">
        <name>Seat Tube</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="478" number="MB-6061">
          <name>Metal Bar 2</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="534" number="TO-2301">
        <name>Top Tube</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="482" number="MS-0253">
          <name>Metal Sheet 2</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="804" number="FK-9939">
        <name>HL Fork</name>
        <list-price>229.4900</list-price>
        <quantity>1.00</quantity>
        <item id="316" number="BL-2036">
          <name>Blade</name>
          <list-price>0.0000</list-price>
          <quantity>2.00</quantity>
          <item id="486" number="MS-2341">
            <name>Metal Sheet 5</name>
            <list-price>0.0000</list-price>
            <quantity>1.00</quantity>
          </item>
        </item>
        <item id="331" number="FE-3760">
          <name>Fork End</name>
          <list-price>0.0000</list-price>
          <quantity>2.00</quantity>
          <item id="482" number="MS-0253">
            <name>Metal Sheet 2</name>
            <list-price>0.0000</list-price>
            <quantity>1.00</quantity>
          </item>
        </item>
        <item id="350" number="FC-3654">
          <name>Fork Crown</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
          <item id="486" number="MS-2341">
            <name>Metal Sheet 5</name>
            <list-price>0.0000</list-price>
            <quantity>1.00</quantity>
          </item>
        </item>
        <item id="531" number="SR-2098">
          <name>Steerer</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
          <item id="487" number="MS-2348">
            <name>Metal Sheet 6</name>
            <list-price>0.0000</list-price>
            <quantity>1.00</quantity>
          </item>
        </item>
      </item>
    </item>
    <item id="807" number="HS-3479">
      <name>HL Headset</name>
      <list-price>124.7300</list-price>
      <quantity>1.00</quantity>
      <item id="1" number="AR-5381">
        <name>Adjustable Race</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="4" number="BE-2908">
        <name>Headset Ball Bearings</name>
        <list-price>0.0000</list-price>
        <quantity>8.00</quantity>
      </item>
      <item id="323" number="CR-9981">
        <name>Crown Race</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="402" number="KW-4091">
        <name>Keyed Washer</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="459" number="LN-9080">
        <name>Lock Nut 19</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
      <item id="462" number="LR-8520">
        <name>Lower Head Race</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
      </item>
    </item>
    <item id="813" number="HB-R956">
      <name>HL Road Handlebars</name>
      <list-price>120.2700</list-price>
      <quantity>1.00</quantity>
      <item id="329" number="EC-R098">
        <name>Road End Caps</name>
        <list-price>0.0000</list-price>
        <quantity>2.00</quantity>
        <item id="482" number="MS-0253">
          <name>Metal Sheet 2</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="358" number="GT-2908">
        <name>HL Grip Tape</name>
        <list-price>0.0000</list-price>
        <quantity>40.00</quantity>
      </item>
      <item id="398" number="HT-2981">
        <name>Handlebar Tube</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="487" number="MS-2348">
          <name>Metal Sheet 6</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
      <item id="529" number="SM-9087">
        <name>Stem</name>
        <list-price>0.0000</list-price>
        <quantity>1.00</quantity>
        <item id="477" number="MB-2024">
          <name>Metal Bar 1</name>
          <list-price>0.0000</list-price>
          <quantity>1.00</quantity>
        </item>
      </item>
    </item>
  </item>
</items>';

SET @xslt = N'<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	
	<xsl:template match="/">
	  <x>
<xsl:if test="element-available(''xsl:apply-imports'')">
xsl:apply-imports = available
</xsl:if>
<xsl:if test="element-available(''xsl:apply-templates'')">
xsl:apply-templates = available
</xsl:if>
<xsl:if test="element-available(''xsl:attributes'')">
xsl:attributes = available
</xsl:if>
<xsl:if test="element-available(''xsl:call-template'')">
xsl:call-template = available
</xsl:if>
<xsl:if test="element-available(''xsl:choose'')">
xsl:choose = available
</xsl:if>
<xsl:if test="element-available(''xsl:comment'')">
xsl:comment = available
</xsl:if>
<xsl:if test="element-available(''xsl:copy'')">
xsl:copy = available
</xsl:if>
<xsl:if test="element-available(''xsl:copy-of'')">
xsl:copy-of = available
</xsl:if>
<xsl:if test="element-available(''xsl:element'')">
xsl:element = available
</xsl:if>
<xsl:if test="element-available(''xsl:fallback'')">
xsl:fallback = available
</xsl:if>
<xsl:if test="element-available(''xsl:for-each'')">
xsl:for-each = available
</xsl:if>
<xsl:if test="element-available(''xsl:if'')">
xsl:if = available
</xsl:if>
<xsl:if test="element-available(''xsl:message'')">
xsl:message = available
</xsl:if>
<xsl:if test="element-available(''xsl:number'')">
xsl:number = available
</xsl:if>
<xsl:if test="element-available(''xsl:processing-instruction'')">
xsl:processing instruction = available
</xsl:if>
<xsl:if test="element-available(''xsl:text'')">
xsl:text = available
</xsl:if>
<xsl:if test="element-available(''xsl:value-of'')">
xsl:value-of = available
</xsl:if>
<xsl:if test="element-available(''xsl:variable'')">
xsl:variable = available
</xsl:if>
	  </x>
	</xsl:template>
</xsl:stylesheet>';
	

SELECT dbo.fn_XsltTransform (@xml, @xslt);
