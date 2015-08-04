/**
 * 
 */
package com.alcatel.lucent.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcatel.lucent.dao.CountrylanguageDAO;
import com.alcatel.lucent.model.Countrylanguage;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAOImpl;

/**
 * @author eminy
 *
 */
@Repository("countryLanguageDAO")
public class CountryLanguageDAOImpl extends GenericDAOImpl<Countrylanguage, Long> implements
		CountrylanguageDAO {
	
	@Autowired
	public void setSessionName(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

}
