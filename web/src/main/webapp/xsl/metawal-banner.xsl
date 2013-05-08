<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">
             
  <xsl:template name="metawal-banner">
    <xsl:param name="withLogin" select="false()"/>
          
        <!--start SPW banner-->  
        <div id="top-spw-global">
            <div class="container_16">
                <div class="top-spw-global">
                    <!--start grid_16-->
                    <div class="grid_16">
                        <a class="portail-walloniebe" target="_blank" href="http://www.wallonie.be">Portail WALLONIE.BE</a>
                        <a class="federation-wallonie-bruxelles" target="_blank" href="http://www.federation-wallonie-bruxelles.be/">Fédération Wallonie-Bruxelles</a>
                        <a class="guide-des-institutions" target="_blank" href="http://www.wallonie.be/fr/guide/guide-services">Guide des institutions</a>
                        <div class="clear"></div>
                        <div class="clear"></div>
                        <div class="clear"></div>
                    </div>
                    <!--stop grid_16-->
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div id="header_spw">
            <div class="container_16">
                <div class="header_spw">
                    <!--start grid_10-->
                    <div class="grid_10">
                        <!--<div id="header_spw-col1" class="header_spw-col1noprint" style="padding-top:0px">-->
                        <div id="header_spw-col1" class="header_spw-col1noprint">
                            <p>
                                <a title="Portail de la Wallonie" target="_blank" href="http://www.wallonie.be">
                                    <span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
                                </a>
                                <a class="geoLink" title="Accueil" href="/cms/home.html"><xsl:value-of select="/root/gui/strings/metawalGeoportalTitle" /></a>
                                <div id="header_spw-col1-el1">
									<h2 id="header_spw-col1-h2"><xsl:value-of select="/root/gui/strings/metawalMetawalTitle" /></h2>
								</div>
                            </p>
                            <div class="clear"></div>
                          </div>
						<div class="clear"></div>
				</div>
				<!-- -->
				<div class="grid_6">
            		<div class="noprint">
     					<div class="noprint">
     						<div class="topQuickHeadertop">
     							<a href="http://geoportail.wallonie.be/cms/home.html" alt="Accueil " title="Accueil " target="_blank">Accueil </a>
								<span> - </span>
								<a href="http://geoportail.wallonie.be/cms/home/contact.html" alt="Contact" title="Contact" target="_blank">Contact</a>
								<span> - </span>
								<a href="#" onclick="Ext.getDom('shortcut').style.display='block';">Information</a></div>
     						<div class="clear"></div>
     						<div class="clear"></div>
     					</div>
                            
                            <xsl:if test="$withLogin">
                            	<div class="noprint1">
									<div class="topQuickHeader"><div  id="lang-form"></div></div>
									<br class="clear"/>
									<div class="clear"></div>
								</div>
		    					<div class="loginForm noprint"></div>
		    					<div class="topQuickHeaderbottom"><div  id="login-form"></div></div>
									<br class="clear"/>
								<div class="clear"></div>
                            </xsl:if>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
