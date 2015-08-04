package com.emin.yuce.dao;

import java.io.Serializable;
import java.util.List;

import com.emin.yuce.model.User;


public interface UserDAO<T, Id extends Serializable> 
	extends GenericDao<T, Id> {
	 public User findByName(String name);
     public List<User> findByPassword(String status);

}
