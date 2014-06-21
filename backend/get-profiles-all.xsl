<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">


  <xsl:output saxon:next-in-chain="force-elements.xsl"/>

  <xsl:strip-space elements="*"/>  


<xsl:template match="applicability"><applicability><xsl:value-of select="normalize-space(.)"/></applicability></xsl:template>


<xsl:template match="taxonomy|lists|organisations|community-of-interest|standard"/>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/> 
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
  
