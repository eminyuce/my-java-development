package com.mkyong.common.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mkyong.customer.model.TableInformationSchema;
import com.mkyong.customer.model.TableMetaData;


@Component("RooScript")
public class RooEntityCode implements GenerateCode {

	
	public static Logger logger = Logger.getLogger(RooEntityCode.class);
	@Autowired
	JDBCDatabaseMetaDataExample jdbcMetaData;
	
//	 For this step I am going to use a script that I found in the Spring Roo forums; 
//	 I have made several enhancements to the script to to make it usable. 
//	 The script introspects the databse schema and generates Roo entity fild creation commands.
//
//	 The first step is to run the script to create the Roo entity field creation commands. 
//	 In a separate window log back in to MySQL and run the following script:
//	select concat('field ',elt(
//			field(data_type,'int' ,'varchar','bit' ,'timestamp','datetime', 'date', 'tinyint'),
//			'number','string' ,'boolean','date','date','date','number'),' --fieldName ',column_name,if (is_nullable='NO',' --notNull ',' '),
//			if(character_maximum_length is not null,	concat(' --sizeMax ',character_maximum_length,' '),''),
//			elt(
//			field(data_type,'int' ,'varchar','bit' ,'timestamp','datetime','date', 'tinyint'),
//			'--type java.lang.Integer','--type java.lang.String' ,'--type java.lang.Boolean','--type java.util.Date','--type java.util.Date','--type java.util.Date','--type java.lang.Integer')
//			) from information_schema.columns cols 
//			where table_name='category' and Table_SCHEMA ='sakila'
			
	public void generateScript() {
		logger.info("-----------------------ROO GENERATOR---------------");

		ArrayList<TableInformationSchema> tableMetaDataList = jdbcMetaData
				.getMetadataFromSql();
		StringBuilder resultString = new StringBuilder();
		 
		ArrayList<String> tableNameList = new ArrayList<String>();
		for (TableInformationSchema tableInformationSchema : tableMetaDataList) {
			String tableName =  tableInformationSchema.getTABLE_NAME();
			if(!tableNameList.contains(tableName)){
				tableNameList.add(tableName);
				resultString.append("//Table Name :  " + tableName + " \n");
				resultString.append("entity jpa --class ~.domain." + tableName + " --activeRecord false --equals --testAutomatically   \n");
			}
			
			
			String colName = tableInformationSchema.getCOLUMN_NAME();
			String isNull = tableInformationSchema.getIS_NULLABLE();
			String characterMaximumLength = tableInformationSchema.getCHARACTER_MAXIMUM_LENGTH();
			String type = tableInformationSchema.getDATA_TYPE();
			if(isNull.equals("YES")){
				isNull = "--Null";
			}else{
				isNull = "--notNull";
			}
			
			if(characterMaximumLength != null){
				resultString.append("field  "+getDataTypeRooEntityConvertionType(type)+" --fieldName "+colName + " --sizeMax "+characterMaximumLength+" "+ isNull + " --type "+this.getDataTypeRooEntityConvertionClass(type)+"  \n");
				
			}else{
				resultString.append("field  "+getDataTypeRooEntityConvertionType(type)+" --fieldName "+colName + "  "+ isNull +  " --type "+this.getDataTypeRooEntityConvertionClass(type)+" \n");
			}
			
		}
	 
		try {
			FileUtils.writeStringToFile(new File("rooEntityScript.txt"),
					resultString.toString());
		} catch (Exception e) {
			logger.error(e);
		}
	}
	 
	public String getDataTypeRooEntityConvertionType(String type){
		
		Hashtable<String, String> hashtable = new Hashtable<String, String>();
		hashtable.put("int", "number");		
		hashtable.put("smallint", "number");
		hashtable.put("varchar", "string");
		hashtable.put("bit", "boolean");
		hashtable.put("timestamp", "date");
		hashtable.put("datetime", "date");
		hashtable.put("date", "date");
		hashtable.put("tinyint", "number");
		hashtable.put("text", "string");
		hashtable.put("decimal", "decimal");
		return hashtable.get(type);
	}
 
	public String getDataTypeRooEntityConvertionClass(String type){
		
		Hashtable<String, String> hashtable = new Hashtable<String, String>();
		hashtable.put("int", "java.lang.Integer");		
		hashtable.put("decimal", "java.lang.Decimal");
		hashtable.put("smallint", "java.lang.Integer");
		hashtable.put("varchar", "java.lang.String");
		hashtable.put("bit", "java.lang.Boolean");
		hashtable.put("timestamp", "java.util.Date");
		hashtable.put("datetime", "java.util.Date");
		hashtable.put("date", "java.util.Date");
		hashtable.put("tinyint", "java.lang.Integer");
		hashtable.put("text", "java.lang.String");
		return hashtable.get(type);
	}
}
