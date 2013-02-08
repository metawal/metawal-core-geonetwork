<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:rw="http://157.164.189.177/geonetwork/xml/schemas/iso19139.rw" 
    xmlns:gmd="http://www.isotc211.org/2005/gmd"
    version="2.0">
    <xsl:import href="../iso19139/index-fields.xsl"/>
    
    <xsl:template match="/" priority="2">
        <xsl:variable name="isoLangId">
            <xsl:call-template name="langId19139"/>
        </xsl:variable>
        
        <Document locale="{$isoLangId}">
            <Field name="_locale" string="{$isoLangId}" store="true" index="true"/>
            
            <Field name="_docLocale" string="{$isoLangId}" store="true" index="true"/>
            
            
            <xsl:variable name="_defaultTitle" select="*[name(.)='rw:MD_Metadata' or @gco:isoType='gmd:MD_Metadata']/gmd:identificationInfo/*/gmd:citation/*/gmd:title/gco:CharacterString"/>
            
            <Field name="_defaultTitle" string="{string($_defaultTitle)}" store="true" index="true"/>
            <!-- not tokenized title for sorting, needed for multilingual sorting -->
            <Field name="_title" string="{string($_defaultTitle)}" store="true" index="true" token="false" />
            
            <xsl:apply-templates select="*[name(.)='rw:MD_Metadata' or @gco:isoType='gmd:MD_Metadata']" mode="metadata"/>
        </Document>
    </xsl:template>
</xsl:stylesheet>