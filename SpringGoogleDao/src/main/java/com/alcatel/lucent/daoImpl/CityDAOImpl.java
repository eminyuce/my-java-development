/**
 * 
 */
package com.alcatel.lucent.daoImpl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcatel.lucent.dao.CityDAO;
import com.alcatel.lucent.model.City;
import com.alcatel.lucent.model.report.CityReportBean;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAOImpl;

/**
 * @author eminy
 * 
 */
@Repository("cityDAO")
public class CityDAOImpl extends GenericDAOImpl<City, Long> implements CityDAO {

	@Autowired
	public void setSessionName(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

	public List<CityReportBean> getCityReport(String name) {
		Session session = getSessionFactory().getCurrentSession();
		Query lazy = session
				.createQuery("select new com.alcatel.lucent.model.report.CityReportBean(ci.name, ci.countryCode,co.continent,ci.population,co.lifeExpectancy,co.gnp )"
						+ " from City ci,Country co where ci.countryCode=co.code and ci.name=:name order by co.continent desc");
		lazy.setString("name", name);

		return lazy.list();
	}

	public List<City> findCitybyName(String name) {
		Query lazy = getSessionFactory().getCurrentSession().createQuery(
				"select t from " + City.class.getName() + " t");
		return lazy.list();
	}

	public List<CityReportBean> findCityByCountryCode(String code) {
		Session session = getSessionFactory().getCurrentSession();
		Query lazy = session
				.createQuery("select new "
						+ CityReportBean.class.getName()
						+ "(ci.name, ci.countryCode,co.continent,ci.population,co.lifeExpectancy,co.gnp )"
						+ " from City ci,Country co where ci.countryCode=co.code and ci.countryCode=:code order by co.continent desc");
		lazy.setString("code", code);
		return lazy.list();
	}

	// call Test_Stored_Proc('1000',TIME('2003-12-31 01:02:03'),1)
	public  List<City>  callStoredProcedure(String name) {
		Session session = getSessionFactory().getCurrentSession();
		Query lazy = session.getNamedQuery("SP_Test_Stored_Proc");
		lazy.setString("name", name);
		return lazy.list();
	}

	// call Test_Stored_Proc2('1000')
	public List<City> callStoredProcedure2(String countryCode) {
		Session session = getSessionFactory().getCurrentSession();
		
		SQLQuery lazy = session
				.createSQLQuery("call Test_Stored_Proc2(:p_Country_Code)");
		lazy.addEntity(City.class);
		lazy.setString("p_Country_Code", countryCode);
		return lazy.list();
	}

	public List<City> findByPopulation(String population) {
		// TODO Auto-generated method stub
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.getNamedQuery("City.findByPopulation");
		query.setString("population", population);
		return query.list();
	}
	// it does not work.. why??
	public List<CityReportBean> callStoredProcedure3(String code) {
		Session session = getSessionFactory().getCurrentSession();
		Query  lazy = session.getNamedQuery("SP_Test_Stored_Proc3");
		lazy.setString("code", code);
		return lazy.list();
	}

}
