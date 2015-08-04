package com.mkyong.common.service;

import java.io.File;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mkyong.customer.model.TableMetaData;

@Component("genericScript")
public class GenerateCodeFromTemplate implements GenerateCode {

	public static Logger logger = Logger.getLogger(GenerateMysqlScript.class);

	@Autowired
	JDBCDatabaseMetaDataExample jdbcMetaData;
	private String tableName = "payment";

	public void generateScript() {
		logger.info("-----------------------SCRIPT GENERATOR---------------");

		Hashtable<String, ArrayList<TableMetaData>> tableMetaDataList = jdbcMetaData
				.useMetaData();
		StringBuilder resultString = new StringBuilder();
		Enumeration<String> enumKey = tableMetaDataList.keys();
		/* first, get and initialize an engine */
		VelocityEngine ve = new VelocityEngine();
		ve.init();
		/* next, get the Template */
		Template t = ve.getTemplate("helloworld.vm");
		/* create a context and add data */

		while (enumKey.hasMoreElements()) {
			String key = enumKey.nextElement();
			ArrayList<TableMetaData> arrayList = tableMetaDataList.get(key);
			resultString.append("-----------Table Name :  " + key + " \n");
			

			
			for (TableMetaData tableMetaData : arrayList) {
				
		
				VelocityContext context2 = new VelocityContext();
				//resultString.append(tableMetaData + "  \n");
				context2.put("variable",
						tableMetaData.getColName());
				
				/* now render the template into a StringWriter */
				StringWriter writer = new StringWriter();
				t.merge(context2, writer);
				resultString.append(writer.toString() + "\n");
			}
		
			
		}
		

		try {
			FileUtils.writeStringToFile(new File("mysqlScript2.txt"),
					resultString.toString());
		} catch (Exception e) {
			logger.error(e);
		}
	}

}
