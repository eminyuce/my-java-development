package com.alcatel.lucent.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcatel.lucent.dao.UserDao;
import com.alcatel.lucent.model.User;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAOImpl;

/**
 * Created by IntelliJ IDEA. User: eminy Date: 6/26/12 Time: 9:27 AM To change
 * this template use File | Settings | File Templates.
 */
@Repository("usersDao")
public class UserDaoImpl extends GenericDAOImpl<User, Long> implements UserDao {

	@Autowired
	public void setSessionName(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

	public List<User> findbyCommandTimeOut(String commandTimeOut) {
		Query lazy = getSessionFactory().getCurrentSession().createQuery("Select * from User where COMMAND_TIMEOUT="+commandTimeOut);
		return lazy.list();
	}

}
