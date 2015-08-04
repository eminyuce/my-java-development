package com.alcatel.lucent.dao;

import java.util.List;

import com.alcatel.lucent.model.User;
import com.googlecode.genericdao.dao.hibernate.original.GenericDAO;
/**
 * Created by IntelliJ IDEA.
 * User: eminy
 * Date: 6/26/12
 * Time: 9:27 AM
 * To change this template use File | Settings | File Templates.
 */
public interface UserDao  extends GenericDAO<User, Long> {
	
	public List<User> findbyCommandTimeOut(String commandTimeOut);
	
}
