package com.emin.yuce.dao;

import java.io.Serializable;
import java.util.List;

import com.emin.yuce.dao.exception.DaoException;
import com.emin.yuce.model.User;


public interface UserDAO <T, Id extends Serializable> extends GenericDao<T, Id> {
	 public User findById(String id) throws DaoException;
	 public User findByName(String name) throws DaoException;
     public List<User> findByPassword(String status) throws DaoException;

}
