<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon">

<!--
<xsl:output indent="yes"/>
-->
<xsl:output indent="yes" saxon:next-in-chain="../../bJSON/jml2json.xsl"/>

<xsl:strip-space elements="*"/>  

<xsl:template match="taxonomy|lists|community-of-interest|organisations"/>

<xsl:template match="*">
  <xsl:message terminate="yes">
    <xsl:text>Element </xsl:text>
    <xsl:value-of select="local-name(.)"/>
    <xsl:text> in namespace '</xsl:text>
    <xsl:value-of select="namespace-uri(.)"/>
    <xsl:text>' encountered</xsl:text>
    <xsl:if test="parent::*">
      <xsl:text> in </xsl:text>
      <xsl:value-of select="name(parent::*)"/>
    </xsl:if>
    <xsl:text>, but no template matches.</xsl:text>
  </xsl:message>

  <span style="color: red">
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="name(.)"/>
    <xsl:text>&gt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&lt;/</xsl:text>
    <xsl:value-of select="name(.)"/>
    <xsl:text>&gt;</xsl:text>
  </span>
</xsl:template>


<xsl:template match="standards">
  <jsonObject>
    <xsl:apply-templates/>
  </jsonObject>
</xsl:template>


<xsl:template match="revhistory">
  <nameValuePair>
    <jsonString>revhistory</jsonString>
    <jsonValue><jsonArray><!--<xsl:apply-templates/>--></jsonArray></jsonValue>
  </nameValuePair>
</xsl:template>




<xsl:template match="records">
  <nameValuePair>
    <jsonString>standard</jsonString>
    <jsonValue>
       <jsonArray>
          <xsl:apply-templates select="standard"/>
       </jsonArray>
    </jsonValue>
  </nameValuePair>
  <nameValuePair>
    <jsonString>profile</jsonString>
    <jsonValue>
       <jsonArray>
          <xsl:apply-templates select="profile"/>
       </jsonArray>
    </jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="standard">
  <arrayElement>
    <jsonObject>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </jsonObject>
  </arrayElement>
</xsl:template>


<xsl:template match="document">
  <nameValuePair>
    <jsonString>document</jsonString>
    <jsonValue>
      <jsonObject>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="substandards"/>
        <xsl:if test="count(correction)>0">
          <nameValuePair>
             <jsonString>correction</jsonString>
             <jsonValue><jsonArray><xsl:apply-templates select="correction"/></jsonArray></jsonValue>
          </nameValuePair>          
        </xsl:if>
        <xsl:apply-templates select="alsoknown"/>
        <xsl:apply-templates select="comment"/>
      </jsonObject>
    </jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="substandards">
  <xsl:if test="count(refstandard)>0">
    <nameValuePair>
      <jsonString>refstandard</jsonString>
      <jsonValue><jsonArray></jsonArray></jsonValue>
    </nameValuePair>
  </xsl:if>
</xsl:template>

<xsl:template match="correction">
  <arrayElement>
  <jsonObject>
     <nameValuePair>
       <jsonString>cpubnum</jsonString>
       <jsonValue><jsonString><xsl:value-of select="@cpubnum"/></jsonString></jsonValue>
     </nameValuePair>
     <nameValuePair>
       <jsonString>date</jsonString>
       <jsonValue><jsonString><xsl:value-of select="@date"/></jsonString></jsonValue>
     </nameValuePair>
  </jsonObject>
  </arrayElement>
</xsl:template>

<xsl:template match="alsoknown">
  <nameValuePair>
    <jsonString>alsoknown</jsonString>
    <jsonValue><jsonString><xsl:apply-templates/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>

<xsl:template match="comment">
  <nameValuePair>
    <jsonString>comment</jsonString>
    <jsonValue><jsonString><xsl:apply-templates/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="applicability">
  <nameValuePair>
    <jsonString>applicability</jsonString>
    <jsonValue><jsonString><xsl:apply-templates/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>

<xsl:template match="status">
  <nameValuePair>
    <jsonString>status</jsonString>
    <jsonValue>
      <jsonObject>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates/>
      </jsonObject>
    </jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="info">
  <nameValuePair>
    <jsonString>info</jsonString>
    <jsonValue><jsonString><xsl:apply-templates/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="uri">
  <nameValuePair>
    <jsonString>uri</jsonString>
    <jsonValue><jsonString><xsl:value-of select="."/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="history">
  <nameValuePair>
    <jsonString>event</jsonString>
    <jsonValue><jsonArray><xsl:apply-templates/></jsonArray></jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="event">
  <arrayElement>
  <jsonObject>
    <xsl:apply-templates select="@*"/>
    <nameValuePair>
      <jsonString>_content</jsonString>
      <jsonValue><jsonString><xsl:value-of select="."/></jsonString></jsonValue>
    </nameValuePair>
  </jsonObject>
  </arrayElement>
</xsl:template>


<xsl:template match="uuid">
  <nameValuePair>
    <jsonString>uuid</jsonString>
    <jsonValue><jsonString><xsl:value-of select="."/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>




<xsl:template match="profile">
  <arrayElement>
    <jsonObject>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </jsonObject>
  </arrayElement>
</xsl:template>




<xsl:template match="profilespec">
  <nameValuePair>
    <jsonString>profilespec</jsonString>
    <jsonValue>
      <jsonObject>
        <xsl:apply-templates select="@*"/>
      </jsonObject>
    </jsonValue>
  </nameValuePair>  
</xsl:template>


<xsl:template match="profilenote">
  <nameValuePair>
    <jsonString>profilenote</jsonString>
    <jsonValue><jsonString><xsl:value-of select="profilenote"/></jsonString></jsonValue>
  </nameValuePair>  
</xsl:template>

<xsl:template match="configuration">
  <nameValuePair>
    <jsonString>configuration</jsonString>
    <jsonValue><jsonString><xsl:value-of select="configuration"/></jsonString></jsonValue>
  </nameValuePair>  
</xsl:template>

<xsl:template match="parts">
  <nameValuePair>
    <nameValuePair>
      <jsonString>parts</jsonString>
      <jsonValue><jsonArray></jsonArray></jsonValue>
    </nameValuePair>
  </nameValuePair>
</xsl:template>


<xsl:template match="@*">
  <nameValuePair>
    <jsonString><xsl:value-of select="name(.)"/></jsonString>
    <jsonValue><jsonString><xsl:value-of select="."/></jsonString></jsonValue>
  </nameValuePair>
</xsl:template>


<xsl:template match="text()">
  <xsl:value-of select="."/>
</xsl:template>

<!-- Handle DocBook Elements -->

<xsl:template match="itemizedlist"><ul><xsl:apply-templates/></ul></xsl:template>

<xsl:template match="orderedlist"><ol><xsl:apply-templates/></ol></xsl:template>

<xsl:template match="listitem"><li><xsl:apply-templates/></li></xsl:template>

<xsl:template match="para"><p><xsl:apply-templates/></p></xsl:template>

<xsl:template match="superscript"><sup><xsl:apply-templates/></sup></xsl:template>

<xsl:template match="emphasis"><em><xsl:apply-templates/></em></xsl:template>

<xsl:template match="mediaobject"><XXX-media-object-XXX/></xsl:template>

<xsl:template match="ulink"><XXX-ulink-XXX/></xsl:template>


<xsl:template match="applicability//uri"><a><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute><xsl:value-of select="."/></a></xsl:template>


</xsl:stylesheet>
