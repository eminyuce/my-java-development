package com.emin.yuce.dao;

import java.io.Serializable;
import java.util.List;

import com.emin.yuce.model.report.CityReportBean;

public interface CityDAO<T, Id extends Serializable> {
	
	public List<CityReportBean> getReport(String name);

}
