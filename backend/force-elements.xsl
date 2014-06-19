<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">

  <!-- There seems to be a regression in xml-to-json.xsl, so transform
       all attributes to elements since this seems to work -->


<xsl:output saxon:next-in-chain="xml-to-json.xsl"/>

<xsl:strip-space elements="*"/>  


<xsl:template match="@*">
  <xsl:element name="{name()}">
     <xsl:value-of select="."/>
  </xsl:element>
</xsl:template>


<xsl:template match="node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/> 
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
  
