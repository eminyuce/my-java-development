package com.emin.yuce.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.emin.yuce.dao.UserDAO;
import com.emin.yuce.model.User;

@Repository("userDaoImpl")
public class UserDAOImpl<T, Id extends Serializable> extends
		GenericDaoHibernateImpl<T, Id> implements UserDAO<T, Id> {
	
    public UserDAOImpl() {
        super();
        super.setPersistentClass(User.class);  
    }
    
	public User findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> findByPassword(final String password) {
		return (List<User>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						StringBuffer hqlQuery = new StringBuffer(
								"from User where password=:password");
						Query query = session.createQuery(hqlQuery.toString());
						query.setString("password", password);
						List<User> maximoAlarmParameters = query.list();
						return maximoAlarmParameters;
					}
				});
	}

}
