package com.mkyong.common;

import java.io.StringWriter;
import java.sql.SQLException;

import com.mkyong.common.service.GenerateCode;
import com.mkyong.common.service.GenerateMysqlScript;
import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mkyong.common.service.JDBCDatabaseMetaDataExample;
 

public class App 
{
	
	public static Logger logger = Logger.getLogger(App.class);

	 
    public static void main( String[] args ) throws SQLException
    {

        ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
        GenerateCode metaDataBase = (GenerateCode) context.getBean("RooScript");
        metaDataBase.generateScript();
        
    

     }
}
