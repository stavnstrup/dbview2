<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">


  <xsl:output saxon:next-in-chain="force-elements.xsl"/>

  <xsl:strip-space elements="*"/>  


  <xsl:template match="applicability"><applicability><xsl:value-of select="normalize-space(.)"/></applicability></xsl:template>

<!--
  <xsl:template match="para|em"/>
 -->

<xsl:template match="taxonomy|lists|organisations|community-of-interest|profile"/>


<!--
<xsl:template match="para"><p><xsl:apply-templates/></p></xsl:template>

<xsl:template match="itemizedlist"><ul><xsl:apply-templates/></ul></xsl:template>
<xsl:template match="listitem"><li><xsl:apply-templates/></li></xsl:template>
-->

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/> 
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
  
