<?xml version="1.0" encoding="Shift_JIS" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="4v.0" encoding="Shift_JIS" indent="yes"/>
<xsl:variable name="separator" select="':'" /> 
<xsl:variable name="period" select="'.'" />
<xsl:strip-space elements="*"/>
<xsl:template match="/">
<html lang="ja">
<head>
<title>
<xsl:value-of select="iEditDoc/inode[position()='1']/label"/>
</title>
<style type="text/css">
body
{ font-weight: 200; font-size: 13pt; color: black; background-image: url("iEditBlue.gif");line-height: 130%; margin-left: 0.5cm; }
.level0
{border-style:double; border-color:navy; border-width:8 15 8 15;font-weight: 900; font-size: 18pt; color:navy; line-height: 150%;padding-left:5 }
.level1
{display: block;border-style:solid; border-color:blue; border-width:3 0 0 18;text-indent:4pt;font-weight: 800; font-size: 16pt; color: navy; line-height: 120%; margin-left: 10pt;padding-left:5}
.level2
{display: block;border-style:solid; border-color:#0099cc; border-width:3 0 0 16;text-indent:4pt;font-weight: 800; font-size: 16pt;font-stretch:ultra-expanded; color: navy; line-height: 120%; margin-left: 15pt;padding-left:5}
.level3
{display: block;border-style:solid; border-color:#00c0c0; border-width:3 0 0 14;text-indent:4pt;font-weight: 800; font-size: 14pt; color:navy; line-height: 120%;margin-left: 20pt;padding-left:5}
.level4
{display: block;border-style:solid; border-color:teal; border-width:3 0 0 12;text-indent4pt;font-weight: 800; font-size: 12pt; color:navy; line-height: 120%; margin-left: 25pt;padding-left:5}
.level5
{display: block;border-style:solid; border-color:gray; border-width:3 0 0 10;text-indent:4pt;font-weight: 800; font-size: 11pt; color:navy; line-height: 120%; margin-left: 30pt;padding-left:5}
.level6
{display: block;border-style:solid; border-color:silver; border-width:3 0 0 8;text-indent:4pt;font-weight: 800; font-size: 11pt; color:navy; line-height: 120%; margin-left: 35pt;padding-left:5}
.titletext{margin-left: 12pt;font-weight: 900; font-size: 18pt; color:navy; line-height: 100%;padding-left:10 }
.text1{margin-left: 17pt;font-weight: 200; font-size: 12pt; color: black;}
.text2{margin-left: 24pt;font-weight: 200; font-size: 12pt; color: black;}
.text3{margin-left: 27pt;font-weight: 200; font-size: 12pt; color: black;}
.text4{margin-left: 30pt;font-weight: 200; font-size: 12pt; color: black;}
.text5{margin-left: 35pt;font-weight: 200; font-size: 12pt; color: black;}
.text6{margin-left: 40pt;font-weight: 200; font-size: 10pt; color: black;}
.link{margin-left: 20pt;font-weight: 900; font-size: 12pt; color: black;}
</style>
</head>
<body>
<!-- level0のinodeは冒頭に一回だけ出現します -->
  <xsl:for-each select="iEditDoc/inode[position()='1']">
   <div class="level0">
     <xsl:value-of select="label"/>
   <div class="titletext">
    <xsl:value-of select="text"/>
   </div>
   </div>
  <!-- リンクを挿入 -->
    <xsl:call-template name="link">
      <xsl:with-param name="idNo" select="id" />
    </xsl:call-template>
  <!-- 逆リンクを挿入 -->
    <xsl:call-template name="relink">
      <xsl:with-param name="idNo" select="id" />
    </xsl:call-template>
 </xsl:for-each>
 <br/>
 <xsl:apply-templates select="iEditDoc">
 </xsl:apply-templates>
</body>
</html>
</xsl:template>
<xsl:template match="iEditDoc">
    <xsl:apply-templates select="inode[level = 1]" mode="main">
      <xsl:with-param name="preChapter" select="''" />
    </xsl:apply-templates>
</xsl:template>
<xsl:template match="inode" mode="main">
  <xsl:param name="preChapter" />
  <xsl:variable name="chapter" select="concat($preChapter, position())" />
  <xsl:variable name="nextlevel" select="level + 1" />
  <!-- 要素を出力します -->
  <xsl:if test="label[.!='']">
  <xsl:element name="div">
    <xsl:attribute name="class">
    <xsl:text>level</xsl:text>
    <xsl:value-of select="level" />
    </xsl:attribute>
  <xsl:element name="a">
    <xsl:attribute name="name">
    <xsl:value-of select="id" />
    </xsl:attribute>
    <xsl:value-of select="$chapter" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="label" />
  </xsl:element>
  </xsl:element>
  <xsl:element name="div">
    <xsl:attribute name="class">
    <xsl:text>text</xsl:text>
    <xsl:value-of select="level" />
    </xsl:attribute>
   <xsl:for-each select="text">
   <xsl:apply-templates/>
   </xsl:for-each>
  <!-- リンクを挿入 -->
      <xsl:call-template name="link">
        <xsl:with-param name="idNo" select="id" />
      </xsl:call-template>
  <!-- 逆リンクを挿入 -->
      <xsl:call-template name="relink">
        <xsl:with-param name="idNo" select="id" />
      </xsl:call-template>
  </xsl:element>
  <br/>
  </xsl:if>
  <!-- そのlevelと同値または高い値のinodeの位置(境界)を求めます -->
  <xsl:variable name="borderList">
    <xsl:apply-templates select="following-sibling::inode" mode="getBorder">
      <xsl:with-param name="levelNo" select="level" />
    </xsl:apply-templates>
  </xsl:variable>
  <xsl:variable
    name="border"
    select="number(substring-before($borderList, $separator))" />
  <!-- 自分より1つ下のlevelの値を持つinodeへ実行を移します -->
  <xsl:choose>
    <!-- 境界がない場合はそのまま1つ下のlevelの値を持つinodeに実行を移します -->
    <xsl:when test="string($border) = 'NaN'">
      <xsl:apply-templates
        select="following-sibling::inode[level = $nextlevel]"
        mode="main">
        <xsl:with-param name="preChapter" select="concat($chapter, $period)" />
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <!-- 境界がある場合、まず1つ下のlevelの値を持つinodeがいくつあるか求めます -->
      <!-- 直接実行を移すとpositionがうまく求められないからです -->
      <xsl:variable
        name="NoNextlevel"
        select="count(following-sibling::inode[position() &lt; $border][level = $nextlevel])" />
      <!-- 数が求まったところで、求めた数の1つ下のlevelのinodeに実行を移します -->
      <xsl:apply-templates
        select="following-sibling::inode[level = $nextlevel][position() &lt;= $NoNextlevel]"
        mode="main">
        <xsl:with-param name="preChapter" select="concat($chapter, $period)" />
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="inode" mode="getBorder">
  <xsl:param name="levelNo" />
  <xsl:if test="level &lt;= $levelNo">
    <xsl:value-of select="position()" />
    <xsl:value-of select="$separator" />
  </xsl:if>
</xsl:template>
<!-- リンクを出力します -->
 <xsl:template name="link">
  <xsl:param name="idNo" />
   <xsl:for-each select="parent::iEditDoc/ilink[from=$idNo]">
    <xsl:choose>
      <xsl:when test="from = to" >
         <hr size="3" width="100%"/>
        <xsl:element name="div">
        <xsl:attribute name="class">
         <xsl:text>link</xsl:text>
        </xsl:attribute>
        <xsl:text>※</xsl:text>
        <xsl:element name="a">
         <xsl:attribute name="href">
           <xsl:value-of select="locate" />
         </xsl:attribute>
           <xsl:value-of select="caption" />
        </xsl:element>
        </xsl:element>
       </xsl:when>
     <xsl:otherwise >
        <hr size="2" width="100%"/>
       <xsl:element name="div">
          <xsl:attribute name="class">
            <xsl:text>link</xsl:text>
          </xsl:attribute>
     <xsl:choose>
      <xsl:when test="linkLine/arrow[.='a_single']" >  
        <xsl:text>--</xsl:text>
        <xsl:value-of select="caption" />
          <xsl:text>--&gt;</xsl:text>
       </xsl:when>
       <xsl:when test="linkLine/arrow[.='a_double']" >  
          <xsl:text>&lt;--</xsl:text>
          <xsl:value-of select="caption" />
           <xsl:text>--&gt;</xsl:text>
       </xsl:when>
       <xsl:when test="linkLine/arrow[.='a_none']" >  
          <xsl:text>--</xsl:text>
          <xsl:value-of select="caption" />
          <xsl:text>--</xsl:text>
       </xsl:when>
      </xsl:choose>
    <xsl:element name="a">
     <xsl:attribute name="href">
       <xsl:text>#</xsl:text>
       <xsl:value-of select="to" />
     </xsl:attribute>
       <xsl:call-template name="idlabel">
         <xsl:with-param name="idto" select="to" />
       </xsl:call-template>
     </xsl:element>
     </xsl:element>
    </xsl:otherwise>  
    </xsl:choose>
    </xsl:for-each>
 </xsl:template>
 <xsl:template name="idlabel">
  <xsl:param name="idto" />
  <xsl:for-each select="parent::iEditDoc/inode">
  <xsl:if test="id = $idto">
    <xsl:value-of select="label" />
  </xsl:if>
  </xsl:for-each>
 </xsl:template>
<!--  逆リンクを出力します -->
 <xsl:template name="relink">
    <xsl:param name="idNo" />
    <xsl:for-each select="parent::iEditDoc/ilink[to=$idNo]">
      <xsl:if test="to != from" >
      <hr size="3" width="100%"/>
      <xsl:element name="div">
      <xsl:attribute name="class">
         <xsl:text>link</xsl:text>
      </xsl:attribute>
      <xsl:choose>
          <xsl:when test="linkLine/arrow[.='a_single']" >  
               <xsl:text>&lt;--</xsl:text>
               <xsl:value-of select="caption" />
             <xsl:text>--</xsl:text>
          </xsl:when>
          <xsl:when test="linkLine/arrow[.='a_double']" >  
               <xsl:text>&lt;--</xsl:text>
               <xsl:value-of select="caption" />
            <xsl:text>--&gt;</xsl:text>
          </xsl:when>
          <xsl:when test="linkLine/arrow[.='a_none']" >  
              <xsl:text>--</xsl:text>
             <xsl:value-of select="caption" />
             <xsl:text>--</xsl:text>
          </xsl:when>
       </xsl:choose>
    <xsl:element name="a">
     <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
      <xsl:value-of select="from" />
      </xsl:attribute>
    <xsl:call-template name="reidlabel">
       <xsl:with-param name="idfrom" select="from" />
     </xsl:call-template>
     </xsl:element>
     </xsl:element>
    </xsl:if>  
  </xsl:for-each>
 </xsl:template>
 <xsl:template name="reidlabel">
    <xsl:param name="idfrom" />
    <xsl:for-each select="parent::iEditDoc/inode">
      <xsl:if test="id = $idfrom">
         <xsl:value-of select="label" />
      </xsl:if>
    </xsl:for-each>
 </xsl:template>
 <!-- text 出力 -->
 <xsl:template name="text" match="text()">
  <xsl:param name="text" select="." />
  <xsl:choose>
   <xsl:when test="contains($text,'&#10;')">
    <xsl:value-of select="substring-before($text,'&#10;')" />
    <br />
    <xsl:call-template name="text">
     <xsl:with-param name="text" select="substring-after($text,'&#10;')" />
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$text" />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>
