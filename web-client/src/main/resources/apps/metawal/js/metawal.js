
function metawalInit(user) {
	try {
		cookie = new Ext.state.CookieProvider({expires: new Date(new Date().getTime() + (1000 * 60 * 60 * 24 * 365))})
		user = cookie.get('user');
	} catch (e) {
		
	}
	if(user){
	    document.getElementById("login_popup").value="Logout";
	    //document.getElementById("login_pop1").value="{/root/gui/strings/metawalBannerLogout}";
	    document.getElementById("login_popup").className="btn";
	    document.getElementById("login_popup").onclick=function(){logout()};
	    document.getElementById("grid_menu").style.display="";
	} else {
	    document.getElementById("login_popup").value="Login";
	    //document.getElementById("login_pop1").value="{/root/gui/strings/metawalBannerLogin}";
	    //document.getElementById("login_pop1").value="<xsl:value-of select='/root/gui/strings/metawalBannerLogin' />";
	    document.getElementById("login_popup").className="btn";
	    document.getElementById("login_popup").className="btn";
	    document.getElementById("login_popup").onclick=function(){window.location.href='#login_form';document.getElementById("login").focus();};
	    document.getElementById("grid_menu").style.display="none";
	    
	 }
}
function logout (){
        location.href = '../../j_spring_security_logout';
}
function login (){
        document.getElementById("login_popup").value="Logout";
        //document.getElementById("login_pop1").value='{/root/gui/strings/metawalBannerLogout}';
        //document.getElementById("login_pop1").value="<xsl:value-of select='/root/gui/strings/metawalBannerLogout' />";
        document.getElementById("login_popup").className="btn";
        document.getElementById("login_popup").className="btn";
        document.getElementById("login_popup").onclick=function(){logout();};
        // TODO get usernam .focus()
        document.getElementById("grid_menu").style.display="";
}
function newmetadata() {
    if (catalogue.isIdentified()) {
        var actionCtn = Ext.getCmp('resultsPanel').getTopToolbar();
        actionCtn.createMetadataAction.handler.apply(actionCtn);
    }
}