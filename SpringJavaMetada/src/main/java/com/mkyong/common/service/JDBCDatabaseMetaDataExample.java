package com.mkyong.common.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Vector;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mkyong.customer.model.TableInformationSchema;
import com.mkyong.customer.model.TableMetaData;

@Component("jdbcMetaData")
public class JDBCDatabaseMetaDataExample {
	Connection con;
	
    public static Logger logger = Logger.getLogger(JDBCDatabaseMetaDataExample.class);

	@Autowired
	public JDBCDatabaseMetaDataExample(DataSource dataSource) {
		try {
			this.con = dataSource.getConnection();
		} catch (SQLException e) {
			logger.error(e);
		}
	}
	
	public ArrayList<TableInformationSchema> getMetadataFromSql(){
		 
		String sql = "SELECT  * FROM  INFORMATION_SCHEMA.COLUMNS COLS 	WHERE   TABLE_SCHEMA = ? ORDER BY TABLE_NAME" ;
		Connection conn = null;
		ArrayList<TableInformationSchema> informationSchemas = new ArrayList<TableInformationSchema>();
		
		try {
			conn = this.con;
			PreparedStatement ps = conn.prepareStatement(sql);
			String tableSchemaName = con.getCatalog();
			
			ps.setString(1, tableSchemaName);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				TableInformationSchema informationSchema = new TableInformationSchema();
				
				String TABLE_CATALOG= rs.getString("TABLE_CATALOG");
				String TABLE_SCHEMA= rs.getString("TABLE_SCHEMA");
				String TABLE_NAME= rs.getString("TABLE_NAME");
				String COLUMN_NAME= rs.getString("COLUMN_NAME");
				String ORDINAL_POSITION= rs.getString("ORDINAL_POSITION");
				String COLUMN_DEFAULT= rs.getString("COLUMN_DEFAULT");
				String IS_NULLABLE= rs.getString("IS_NULLABLE");
				String DATA_TYPE= rs.getString("DATA_TYPE");
				String CHARACTER_MAXIMUM_LENGTH= rs.getString("CHARACTER_MAXIMUM_LENGTH");
				String CHARACTER_OCTET_LENGTH= rs.getString("CHARACTER_OCTET_LENGTH");
				String NUMERIC_PRECISION= rs.getString("NUMERIC_PRECISION");
				String NUMERIC_SCALE= rs.getString("NUMERIC_SCALE");
				String DATETIME_PRECISION= rs.getString("DATETIME_PRECISION");
				String CHARACTER_SET_NAME= rs.getString("CHARACTER_SET_NAME");
				String COLLATION_NAME= rs.getString("COLLATION_NAME");
				String COLUMN_TYPE= rs.getString("COLUMN_TYPE");
				String COLUMN_KEY= rs.getString("COLUMN_KEY");
				String EXTRA= rs.getString("EXTRA");
				String PRIVILEGES= rs.getString("PRIVILEGES");
				String COLUMN_COMMENT= rs.getString("COLUMN_COMMENT");
				
				informationSchema.setTABLE_CATALOG(TABLE_CATALOG);
				informationSchema.setTABLE_SCHEMA(TABLE_SCHEMA);
				informationSchema.setTABLE_NAME(TABLE_NAME);
				informationSchema.setCOLUMN_NAME(COLUMN_NAME);
				informationSchema.setORDINAL_POSITION(ORDINAL_POSITION);
				informationSchema.setCOLUMN_DEFAULT(COLUMN_DEFAULT);
				informationSchema.setIS_NULLABLE(IS_NULLABLE);
				informationSchema.setDATA_TYPE(DATA_TYPE);
				informationSchema.setCHARACTER_MAXIMUM_LENGTH(CHARACTER_MAXIMUM_LENGTH);
				informationSchema.setCHARACTER_OCTET_LENGTH(CHARACTER_OCTET_LENGTH);
				informationSchema.setNUMERIC_PRECISION(NUMERIC_PRECISION);
				informationSchema.setNUMERIC_SCALE(NUMERIC_SCALE);
				informationSchema.setDATETIME_PRECISION(DATETIME_PRECISION);
				informationSchema.setCHARACTER_SET_NAME(CHARACTER_SET_NAME);
				informationSchema.setCOLLATION_NAME(COLLATION_NAME);
				informationSchema.setCOLUMN_TYPE(COLUMN_TYPE);
				informationSchema.setCOLUMN_KEY(COLUMN_KEY);
				informationSchema.setEXTRA(EXTRA);
				informationSchema.setPRIVILEGES(PRIVILEGES);
				informationSchema.setCOLUMN_COMMENT(COLUMN_COMMENT);
				
				informationSchemas.add(informationSchema);
			}
			rs.close();
			ps.close();
 
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
		
		
		
		return informationSchemas;
	}
	// 	select  * from  information_schema.columns cols 	where   Table_SCHEMA ='sakila'
	public Hashtable<String, ArrayList<TableMetaData>> useMetaData() {

        Hashtable<String, ArrayList<TableMetaData>> hashTable = new Hashtable<String, ArrayList<TableMetaData>>();

        try {
			// to obtain DatabaseMetadata object
			DatabaseMetaData dm = con.getMetaData();
			System.out.println("Get database Major Version : - "
					+ dm.getDatabaseMajorVersion());
			System.out.println("Get database Minor Version : - "
					+ dm.getDatabaseMinorVersion());
			System.out.println("get Database Product name : - "
					+ dm.getDatabaseProductName());
			System.out.println("get Database Product Version : - "
					+ dm.getDatabaseProductVersion());
			System.out.println("Get JDBC Driver Major Version :- "
					+ dm.getDriverMajorVersion());
			System.out.println("Get JDBC Driver Minor Version :- "
					+ dm.getDriverMinorVersion());
			System.out.println("Get driver Name : -" + dm.getDriverName());
			System.out
					.println("get driver version :- " + dm.getDriverVersion());
			System.out.println("Get JDBC Major version :- "
					+ dm.getJDBCMajorVersion());
			System.out.println("Get JDBC Minor version :- "
					+ dm.getJDBCMinorVersion());
			System.out.println("===========");
			String[] types = { "TABLE" };
			String catalog = con.getCatalog();
			String schema = "test"; // name of the database
			DatabaseMetaData dmd = con.getMetaData();
			ResultSet rset = dmd.getTables(catalog, schema, null, types);
			
	       
			while (rset.next()) 
			{
				String tableCat = rset.getString("TABLE_CAT");
				String tableSchem = rset.getString("TABLE_SCHEM");
				String tableName = rset.getString("TABLE_NAME");
				String tableType = rset.getString("TABLE_TYPE");
				String remarks = rset.getString("REMARKS");
	 
				ArrayList<TableMetaData> tableMetaDataList = new ArrayList<TableMetaData>();
				hashTable.put(tableName, tableMetaDataList);
				
				System.out.println(tableName);
			 
				ResultSet rs = dmd.getColumns(catalog, schema, tableName, "%");
				while (rs.next()) 
				{
					 
					String TABLE_CAT = rs.getString("TABLE_CAT");
					String colName = rs.getString("COLUMN_NAME");
					String DATA_TYPE = rs.getString("DATA_TYPE");
					String TYPE_NAME = rs.getString("TYPE_NAME");
					String COLUMN_SIZE = rs.getString("COLUMN_SIZE");
					String BUFFER_LENGTH = rs.getString("BUFFER_LENGTH");
					String DECIMAL_DIGITS = rs.getString("DECIMAL_DIGITS");
					String NUM_PREC_RADIX = rs.getString("NUM_PREC_RADIX");
					String NULLABLE = rs.getString("NULLABLE");
					String REMARKS = rs.getString("REMARKS");
					String COLUMN_DEF = rs.getString("COLUMN_DEF");
					String SQL_DATA_TYPE = rs.getString("SQL_DATA_TYPE");
					String CHAR_OCTET_LENGTH = rs.getString("CHAR_OCTET_LENGTH");
					String ORDINAL_POSITION = rs.getString("ORDINAL_POSITION");
					String IS_NULLABLE = rs.getString("IS_NULLABLE");

					TableMetaData tableMetaData = new TableMetaData();
					tableMetaData.setTypeName(TYPE_NAME);
					tableMetaData.setTableCat(TABLE_CAT);
					tableMetaData.setColName(colName);
					tableMetaData.setDataType(DATA_TYPE);
					tableMetaData.setColumnSize(COLUMN_SIZE);
					tableMetaData.setBufferLength(BUFFER_LENGTH);
					tableMetaData.setDecimalDigits(DECIMAL_DIGITS);
					tableMetaData.setNumPrecRadix(NUM_PREC_RADIX);
					tableMetaData.setNullable(NULLABLE);
					tableMetaData.setRemarks(REMARKS);
					tableMetaData.setColumnDef(COLUMN_DEF);
					tableMetaData.setSqlDataType(SQL_DATA_TYPE);
					tableMetaData.setCharOctetLength(CHAR_OCTET_LENGTH);
					tableMetaData.setOrdinalPosition(ORDINAL_POSITION);
					tableMetaData.setIsNullable(IS_NULLABLE);
					tableMetaData.setTableName(tableName);
					
					tableMetaDataList.add(tableMetaData);
				}
				
			}


		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (this.con != null) {
				try {
					this.con.close();
				} catch (SQLException e) {}
			}

		}
        return hashTable;

    }
}