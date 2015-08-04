/**
 * 
 */
package com.alcatel.lucent.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcatel.lucent.dao.CountryDAO;
import com.alcatel.lucent.model.Country;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAOImpl;

/**
 * @author eminy
 *
 */
@Repository("countryDAO")
public class CountryDAOImpl extends GenericDAOImpl<Country, Long> implements CountryDAO {

	@Autowired
	public void setSessionName(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

}
