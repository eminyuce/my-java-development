package com.emin.yuce.dao;

import java.util.List;

import com.emin.yuce.model.User;
import com.googlecode.genericdao.dao.jpa.GenericDAO;



public interface UserDAO extends GenericDAO<User, Long> {
	 public User findByName(String name);
     public List<User> findByStatus(String status);
     public List<User> findByPassword(String password);
     public User findById(String id);
     

}
