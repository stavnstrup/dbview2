<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">

<xsl:output saxon:next-in-chain="force-elements.xsl"/>

<xsl:param name="mode" select="''"/>

<xsl:strip-space elements="*"/>  

<xsl:template match="standards">
  <nispdb revision="{@revision}">
    <header><xsl:value-of select="$mode"/> Standards</header>
    <xsl:apply-templates select="revhistory"/>
    <xsl:apply-templates select="lists//select[@mode=lower-case($mode)]"/>
  </nispdb>
</xsl:template>

<xsl:template match="select">
  <xsl:variable name="tref" select="../../@tref"/>
  <standard>
    <taxonomy><xsl:value-of select="/standards/taxonomy//*[@id=$tref]/@title"/></taxonomy>
    <id><xsl:value-of select="@id"/></id>
    <title><xsl:value-of select="."/></title>
    <remarks><xsl:value-of select="normalize-space(../remarks)"/></remarks>
    <rationale><xsl:value-of select="normalize-space(../rationale)"/></rationale>
  </standard>
</xsl:template>

<!--
  <xsl:template match="applicability|para|em"/>
-->

<!--
<xsl:template match="revhistory|taxonomy|lists|organisations|community-of-interest"/>
-->


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/> 
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
  
