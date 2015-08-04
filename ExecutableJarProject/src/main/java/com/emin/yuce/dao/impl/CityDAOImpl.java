package com.emin.yuce.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.emin.yuce.dao.CityDAO;
import com.emin.yuce.model.City;
import com.emin.yuce.model.User;
import com.emin.yuce.model.report.CityReportBean;

@Repository("cityDAO")
public class CityDAOImpl<T, Id extends Serializable> extends
		GenericDaoHibernateImpl<T, Id> implements CityDAO<T, Serializable> {

	public CityDAOImpl() {
		super();
		super.setPersistentClass(City.class);
	}

	@Override
	public List<CityReportBean> getReport(final String name) {
		return (List<CityReportBean>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						StringBuffer hqlQuery = new StringBuffer(
								"select new com.emin.yuce.model.report.CityReportBean(ci.Name, ci.CountryCode, co.Continent,ci.Population,co.LifeExpectancy,co.GNP) " +
										" from city ci join country as co");
						Query query = session.createQuery(hqlQuery.toString());
						//query.setString("password", password);
						List<CityReportBean> maximoAlarmParameters = query
								.list();
						return maximoAlarmParameters;
					}
				});
	}
}
