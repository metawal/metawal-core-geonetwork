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
                        <a class="geoportail-de-la-wallonie" target="_blank" href="http://geoportail.wallonie.be/cms/fr/sites/geoportail/home.html">Géoportail de la Wallonie</a>
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
                                <a class="geoLink" title="Accueil" href="/cms/home.html"><xsl:value-of select="/root/gui/strings/metawalBannerTitle" /></a>
                            </p>
                            <div class="clear"></div>
                          </div>
						<div class="clear"></div>
				</div>
				
				<!-- -->
				<div class="grid_6">
					<div class="grid_login">
						<input type="button" id="login_pop1" value="{/root/gui/strings/metawalBannerLogin}"/>
	        		</div>
	        		<a href="#x" class="overlay" id="login_form"></a>
			        <div class="popup">
			            <h2><xsl:value-of select="/root/gui/strings/metawalLoginTitle" /></h2>
			            <p><xsl:value-of select="/root/gui/strings/metawalLoginIntro" /></p>
			            <div>
			                <label for="login"><xsl:value-of select="/root/gui/strings/metawalLoginLogin" /></label>
			                <input type="text" id="login" value="" />
		            	</div>
			        	<div>
			                <label for="password"><xsl:value-of select="/root/gui/strings/metawalLoginPwd" /></label>
			                <input type="password" id="password" value="" />
			            </div>
			            <input type="button" value="{/root/gui/strings/metawalLoginConnection}" onclick="catalogue.login(document.getElementById('login').value,document.getElementById('password').value);login();location.href='#close';"/>
			            <input type="button" value="{/root/gui/strings/metawalLoginCancel}" onclick="location.href='#close';"/>
			        </div>
            		<div class="noprint">
     					<!--  <div class="noprint">
     						<div class="topQuickHeadertop">
     							<a href="http://geoportail.wallonie.be/cms/home.html" alt="Accueil " title="Accueil " target="_blank">Accueil </a>
								<span> - </span>
								<a href="http://geoportail.wallonie.be/cms/home/contact.html" alt="Contact" title="Contact" target="_blank">Contact</a>
								<span> - </span>
								<a href="#" onclick="Ext.getDom('shortcut').style.display='block';">Information</a></div>
     						<div class="clear"></div>
     						<div class="clear"></div>
     					</div>-->
                            
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
                    <div class="grid_menu" id="grid_menu">
                        <ul id="menu">
                        	<li id="gn-menu-search">
                        		<a href="#"><xsl:value-of select="/root/gui/strings/metawalMenuSearch"/></a>
	                        	<ul>
	                        		<li><a href="#"><xsl:value-of select="/root/gui/strings/metawalMenuSearch"/></a></li>
	                        		<li><a href="#"><xsl:value-of select="/root/gui/strings/metawalMenuMyMetadata"/></a></li>
	                        	</ul>
                        	</li>
                        	<li id="gn-menu-encoding">
                        		<a href="#"><xsl:value-of select="/root/gui/strings/metawalMenuEncoding"/></a>  
	                        	<ul>
	                        		<li><a href="#" onclick="newmetadata();"><xsl:value-of select="/root/gui/strings/metawalMenuNewMetadata"/></a></li>
	                        		<li><a href="#" onclick="catalogue.metadataImport();"><xsl:value-of select="/root/gui/strings/metawalMenuImportMetadata"/></a></li>
	                        		<li><a href="#" onclick="catalogue.moveToURL(catalogue.services.harvestingAdmin);"><xsl:value-of select="/root/gui/strings/metawalMenuHarvesting"/></a></li>
	                        	</ul>
                        	</li>
                        	<li id="gn-menu-administration">
                        		<li><a href="#" onclick="catalogue.admin();"><xsl:value-of select="/root/gui/strings/metawalMenuAdmin"/></a></li>
                        	</li>
                        	<li id="gn-menu-csw">
                        		<a href="#" onclick="catalogue.moveToURL(catalogue.services.csw);"><xsl:value-of select="/root/gui/strings/metawalMenuCSW"/></a>
                        	</li>
                        </ul>
					</div>
                </div>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
