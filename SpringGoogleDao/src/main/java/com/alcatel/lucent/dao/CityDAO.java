package com.alcatel.lucent.dao;

import java.util.Date;
import java.util.List;

import com.alcatel.lucent.model.City;
import com.alcatel.lucent.model.report.CityReportBean;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAO;

public interface CityDAO extends GenericDAO<City,Long> {
	
	public List<CityReportBean> getCityReport(String name);
	public List<City> findCitybyName(String name);	
	public List<City> findByPopulation(String population);
	public List<CityReportBean> findCityByCountryCode(String code);
	public List<City> callStoredProcedure(String name);
	public List<City> callStoredProcedure2(String name);
	public List<CityReportBean> callStoredProcedure3(String code);
}
