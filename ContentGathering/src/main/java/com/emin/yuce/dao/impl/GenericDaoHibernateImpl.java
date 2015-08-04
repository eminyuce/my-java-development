package com.emin.yuce.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.emin.yuce.dao.GenericDao;
import com.emin.yuce.dao.exception.DaoException;

public class GenericDaoHibernateImpl<T, Id extends Serializable> extends
		HibernateDaoSupport implements GenericDao<T, Id> {

	protected Class<T> persistentClass;

	private static final Logger logger = Logger
			.getLogger(GenericDaoHibernateImpl.class);

	public GenericDaoHibernateImpl() {

	}

	public GenericDaoHibernateImpl(Class<T> persistentClass) {
		logger.debug("Object created. persistenClass parameter: "
				+ persistentClass);
		this.persistentClass = persistentClass;
	}

	@SuppressWarnings("unchecked")
	public T get(Id objectId) throws DaoException {
		return (T) getHibernateTemplate().get(persistentClass, objectId);
	}

	@SuppressWarnings("unchecked")
	public void delete(Id objectId) throws DaoException {
		T obj = get(objectId);
		delete(obj);
	}

	@SuppressWarnings("unchecked")
	public Id save(T object) throws DaoException {
		Id id = (Id) getHibernateTemplate().save(object);
		this.getSession().evict(object);
		return id;
	}

	public void saveOrUpdate(T object) throws DaoException {
		getHibernateTemplate().saveOrUpdate(object);
		this.getSession().flush();

	}

	public void saveOrUpdateAll(Collection<T> entityList) throws DaoException {
		getHibernateTemplate().saveOrUpdateAll(entityList);
	}

	public void update(T object) throws DaoException {
		getHibernateTemplate().update(object);
	}

	public void delete(T object) throws DaoException {
		getHibernateTemplate().delete(object);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() throws DaoException {
		getHibernateTemplate().setAlwaysUseNewSession(true);
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String str = "from " + persistentClass.getName() + " o";
				Query query = session.createQuery(str);
				List<T> list = query.list();
				logger.debug("Find " + list.size() + " records.");
				return list;
			}
		});
	}

	public void setPersistentClass(Class persistentClass) {
		this.persistentClass = persistentClass;
	}

}