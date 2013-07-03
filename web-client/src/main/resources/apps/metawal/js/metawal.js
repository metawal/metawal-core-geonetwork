cookie = new Ext.state.CookieProvider({expires: new Date(new Date().getTime() + (1000 * 60 * 60 * 24 * 365))})
if(cookie.get('user')){
    document.getElementById("login_pop1").value="Logout";
    // document.getElementById("login_pop1").value="{/root/gui/strings/metawalBannerLogout}";
    document.getElementById("login_pop1").className="btn";
    document.getElementById("login_pop1").onclick=function(){logout()};
    document.getElementById("grid_menu").style.display="";
}
else{
    document.getElementById("login_pop1").value="Login";
    //document.getElementById("login_pop1").value="{/root/gui/strings/metawalBannerLogin}";
    //document.getElementById("login_pop1").value="<xsl:value-of select='/root/gui/strings/metawalBannerLogin' />";
    document.getElementById("login_pop1").className="btn";
    document.getElementById("login_pop1").className="btn";
    document.getElementById("login_pop1").onclick=function(){window.location.href='#login_form';};
    document.getElementById("grid_menu").style.display="none";
    }
function logout (){
        catalogue.logout();
        document.getElementById("login_pop1").value="Login";
        //document.getElementById("login_pop1").value="<xsl:value-of select='/root/gui/strings/metawalBannerLogin' />";
        //document.getElementById("login_pop1").value="{/root/gui/strings/metawalBannerLogin}";
        document.getElementById("login_pop1").className="btn";
        document.getElementById("login_pop1").className="btn";
        document.getElementById("login_pop1").onclick=function(){window.location.href='#login_form';};
        document.getElementById("grid_menu").style.display="none";
}
function login (){
        document.getElementById("login_pop1").value="Logout";
        //document.getElementById("login_pop1").value='{/root/gui/strings/metawalBannerLogout}';
        //document.getElementById("login_pop1").value="<xsl:value-of select='/root/gui/strings/metawalBannerLogout' />";
        document.getElementById("login_pop1").className="btn";
        document.getElementById("login_pop1").className="btn";
        document.getElementById("login_pop1").onclick=function(){logout();};
        document.getElementById("grid_menu").style.display="";
}
function newmetadata() {
    if (catalogue.isIdentified()) {
        var actionCtn = Ext.getCmp('resultsPanel').getTopToolbar();
        actionCtn.createMetadataAction.handler.apply(actionCtn);
    }
}