package com.mkyong.common.service;

import com.mkyong.customer.model.TableMetaData;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

/**
 * Created with IntelliJ IDEA. User: Emin Date: 12/25/12 Time: 8:49 PM To change
 * this template use File | Settings | File Templates.
 */
@Component("mysqlScript")
public class GenerateMysqlScript implements GenerateCode {

	public static Logger logger = Logger.getLogger(GenerateMysqlScript.class);

	@Autowired
	JDBCDatabaseMetaDataExample jdbcMetaData;

	public void generateScript() {
		logger.info("-----------------------SCRIPT GENERATOR---------------");

		Hashtable<String, ArrayList<TableMetaData>> tableMetaDataList = jdbcMetaData
				.useMetaData();

		StringBuilder resultString = new StringBuilder();

		Enumeration<String> enumKey = tableMetaDataList.keys();

		while (enumKey.hasMoreElements()) {
			String key = enumKey.nextElement();
			ArrayList<TableMetaData> arrayList = tableMetaDataList.get(key);
			resultString.append("-----------Table Name :  " + key + " \n");
			for (TableMetaData tableMetaData : arrayList) {
				resultString.append(tableMetaData + "  \n");
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
