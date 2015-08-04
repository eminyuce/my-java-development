package com.mkyong.customer.model;

public class TableMetaData {

	String tableName;
	String tableCat;
	String colName;
	String dataType;
	String typeName;
	String columnSize;
	String bufferLength;
	String decimalDigits;
	String numPrecRadix;
	String nullable;
	String remarks;
	String columnDef;
	String sqlDataType;
	String charOctetLength;
	String ordinalPosition;
	String isNullable;
	/**
	 * @return the tableCat
	 */
	public String getTableCat() {
		return tableCat;
	}
	/**
	 * @param tableCat the tableCat to set
	 */
	public void setTableCat(String tableCat) {
		this.tableCat = tableCat;
	}
	/**
	 * @return the colName
	 */
	public String getColName() {
		return colName;
	}
	/**
	 * @param colName the colName to set
	 */
	public void setColName(String colName) {
		this.colName = colName;
	}
	/**
	 * @return the dataType
	 */
	public String getDataType() {
		return dataType;
	}
	/**
	 * @param dataType the dataType to set
	 */
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}
	/**
	 * @param typeName the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	/**
	 * @return the columnSize
	 */
	public String getColumnSize() {
		return columnSize;
	}
	/**
	 * @param columnSize the columnSize to set
	 */
	public void setColumnSize(String columnSize) {
		this.columnSize = columnSize;
	}
	/**
	 * @return the bufferLength
	 */
	public String getBufferLength() {
		return bufferLength;
	}
	/**
	 * @param bufferLength the bufferLength to set
	 */
	public void setBufferLength(String bufferLength) {
		this.bufferLength = bufferLength;
	}
	/**
	 * @return the decimalDigits
	 */
	public String getDecimalDigits() {
		return decimalDigits;
	}
	/**
	 * @param decimalDigits the decimalDigits to set
	 */
	public void setDecimalDigits(String decimalDigits) {
		this.decimalDigits = decimalDigits;
	}
	/**
	 * @return the numPrecRadix
	 */
	public String getNumPrecRadix() {
		return numPrecRadix;
	}
	/**
	 * @param numPrecRadix the numPrecRadix to set
	 */
	public void setNumPrecRadix(String numPrecRadix) {
		this.numPrecRadix = numPrecRadix;
	}
	/**
	 * @return the nullable
	 */
	public String getNullable() {
		return nullable;
	}
	/**
	 * @param nullable the nullable to set
	 */
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
	/**
	 * @return the remarks
	 */
	public String getRemarks() {
		return remarks;
	}
	/**
	 * @param remarks the remarks to set
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	/**
	 * @return the columnDef
	 */
	public String getColumnDef() {
		return columnDef;
	}
	/**
	 * @param columnDef the columnDef to set
	 */
	public void setColumnDef(String columnDef) {
		this.columnDef = columnDef;
	}
	/**
	 * @return the sqlDataType
	 */
	public String getSqlDataType() {
		return sqlDataType;
	}
	/**
	 * @param sqlDataType the sqlDataType to set
	 */
	public void setSqlDataType(String sqlDataType) {
		this.sqlDataType = sqlDataType;
	}
	/**
	 * @return the charOctetLength
	 */
	public String getCharOctetLength() {
		return charOctetLength;
	}
	/**
	 * @param charOctetLength the charOctetLength to set
	 */
	public void setCharOctetLength(String charOctetLength) {
		this.charOctetLength = charOctetLength;
	}
	/**
	 * @return the ordinalPosition
	 */
	public String getOrdinalPosition() {
		return ordinalPosition;
	}
	/**
	 * @param ordinalPosition the ordinalPosition to set
	 */
	public void setOrdinalPosition(String ordinalPosition) {
		this.ordinalPosition = ordinalPosition;
	}
	/**
	 * @return the isNullable
	 */
	public String getIsNullable() {
		return isNullable;
	}
	/**
	 * @param isNullable the isNullable to set
	 */
	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	 
	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}
	/**
	 * @param tableName the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TableMetaData [tableName=");
		builder.append(tableName);
		builder.append(", tableCat=");
		builder.append(tableCat);
		builder.append(", colName=");
		builder.append(colName);
		builder.append(", dataType=");
		builder.append(dataType);
		builder.append(", typeName=");
		builder.append(typeName);
		builder.append(", columnSize=");
		builder.append(columnSize);
		builder.append(", bufferLength=");
		builder.append(bufferLength);
		builder.append(", decimalDigits=");
		builder.append(decimalDigits);
		builder.append(", numPrecRadix=");
		builder.append(numPrecRadix);
		builder.append(", nullable=");
		builder.append(nullable);
		builder.append(", remarks=");
		builder.append(remarks);
		builder.append(", columnDef=");
		builder.append(columnDef);
		builder.append(", sqlDataType=");
		builder.append(sqlDataType);
		builder.append(", charOctetLength=");
		builder.append(charOctetLength);
		builder.append(", ordinalPosition=");
		builder.append(ordinalPosition);
		builder.append(", isNullable=");
		builder.append(isNullable);
		builder.append("]");
		return builder.toString();
	}

	
	
}
