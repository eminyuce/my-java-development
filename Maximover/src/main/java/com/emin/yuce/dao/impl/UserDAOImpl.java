package com.emin.yuce.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.emin.yuce.dao.UserDAO;
import com.emin.yuce.dao.exception.DaoException;
import com.emin.yuce.model.User;

public class UserDAOImpl<T, Id extends Serializable> extends
		GenericDaoHibernateImpl<T, Id> implements UserDAO<T, Id> {

	public UserDAOImpl(Class<T> tClass) {
		super(tClass);
	}

	@Override
	public User findByName(final String name) {
		return getHibernateTemplate().execute(new HibernateCallback<User>() {
			public User doInHibernate(Session session)
					throws HibernateException, SQLException {
				StringBuffer hqlQuery = new StringBuffer(
						"from User where name=:name");
				Query query = session.createQuery(hqlQuery.toString());
				query.setString("name", name);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

	@Override
	public List<User> findByPassword(final String password) {
		return getHibernateTemplate().execute(
				new HibernateCallback<List<User>>() {
					public List<User> doInHibernate(Session session)
							throws HibernateException, SQLException {
						StringBuffer hqlQuery = new StringBuffer(
								"from User where password=:password");
						Query query = session.createQuery(hqlQuery.toString());
						query.setString("password", password);
						List<User> usersList = (List<User>) query.list();
						return usersList;
					}
				});
	}

	@Override
	public User findById(final String id) throws DaoException {
		return getHibernateTemplate().execute(new HibernateCallback<User>() {
			public User doInHibernate(Session session)
					throws HibernateException, SQLException {
				StringBuffer hqlQuery = new StringBuffer(
						"from User where id=:id");
				Query query = session.createQuery(hqlQuery.toString());
				query.setString("id", id);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

	public long add(int a, int b) {
		return a + b;
	}
}
