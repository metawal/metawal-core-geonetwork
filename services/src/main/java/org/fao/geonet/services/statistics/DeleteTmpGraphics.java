package org.fao.geonet.services.statistics;

import jeeves.constants.Jeeves;
import jeeves.server.ServiceConfig;
import jeeves.server.context.ServiceContext;
import org.fao.geonet.services.NotInReadOnlyModeService;
import org.jdom.Element;

import java.io.File;
import java.io.FileFilter;

/**
 * Service to get the db-stored requests information group by popularity
 * todo: factorize chart code into a factory...
 * todo I18N all strings
 * @author nicolas Ribot
 *
 */
public class DeleteTmpGraphics extends NotInReadOnlyModeService {
	//--------------------------------------------------------------------------
	//---
	//--- Service
	//---
	//--------------------------------------------------------------------------
    @Override
	public Element serviceSpecificExec(Element params, ServiceContext context) throws Exception {
        String message = "No files to delete";
		
		FileFilter pngFilter = new FileFilter()		{
			public	boolean accept(File file){
				return	(file.getAbsolutePath().toLowerCase().endsWith(".png") ||
                        file.getAbsolutePath().toLowerCase().endsWith(".csv"));
			}
		};
		int i = 0;
		File statFolder = new File(context.getAppPath() + File.separator + "images" + File.separator + "statTmp");
		if (statFolder.exists()) {
			File[] files = statFolder.listFiles(pngFilter);
			for (File f : files) {
				if (f.delete()) {
					i++;
				}
			}
			message = i + "";
		}
		
		Element elResp = new Element(Jeeves.Elem.RESPONSE);
		Element elMsg = new Element("message").setText(message);		
		elResp.addContent(elMsg);
		return elResp;
	}

	public void init(String appPath, ServiceConfig params) throws Exception {
		super.init(appPath, params);
		
	}
}
