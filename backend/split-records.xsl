<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">


<xsl:strip-space elements="*"/>  

<xsl:output saxon:next-in-chain="force-elements.xsl"/>

<xsl:template match="standards">
  <xsl:apply-templates select="records/standard"/>
  <xsl:apply-templates select="records/profile"/>
</xsl:template>


<xsl:template match="applicability">
  <applicability>
    <xsl:value-of select="normalize-space(.)"/>
  </applicability>
</xsl:template>

<xsl:template match="refstandard">
  <xsl:variable name="refid" select="@refid"/>
  <refstandard refid="{@refid}" title="{/standards/records/standard[@id=$refid]/document/@title}"/>
</xsl:template>

<xsl:template match="refprofile">
  <xsl:variable name="refid" select="@refid"/>
  <refstandard refid="{@refid}" title="{/standards/records/profile[@id=$refid]/profilespec/@title}"/>
</xsl:template>


<xsl:template match="standard">
  <xsl:variable name="documentname">
    <xsl:text>../data/standards/</xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text>.json</xsl:text>
  </xsl:variable>
  <xsl:result-document href="{$documentname}">
    <standard>
      <xsl:apply-templates select="@*"/> 
      <xsl:apply-templates/>
    </standard>
  </xsl:result-document>
</xsl:template>


<xsl:template match="profile">
  <xsl:variable name="documentname">
    <xsl:text>../data/profiles/</xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text>.json</xsl:text>
  </xsl:variable>
  <xsl:result-document href="{$documentname}">
    <profile>
      <xsl:apply-templates select="@*"/> 
      <xsl:apply-templates/>
    </profile>
  </xsl:result-document>
</xsl:template>


<xsl:template match="event">
  <event info="{.}">
    <xsl:apply-templates select="@*"/> 
  </event>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/> 
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
