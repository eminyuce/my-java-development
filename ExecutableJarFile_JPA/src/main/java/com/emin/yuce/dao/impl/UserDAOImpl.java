package com.emin.yuce.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.emin.yuce.dao.BaseDAO;
import com.emin.yuce.dao.UserDAO;
import com.emin.yuce.model.User;
import com.googlecode.genericdao.dao.jpa.*;


@Repository("userDao")
public class UserDAOImpl extends BaseDAO<User, Long> implements UserDAO {

	

	@Override
	public User findByName(String name) {
//		List<User> list = findByCriteria(Criteria.forClass(User.class).add(Restrictions.eq("name", name)));               
//
//        if(list == null || list.size() != 1) {
//            return null;
//        }
//
//        return list.get(0);
		
		return null;
	}

	@Override
	public List<User> findByStatus(String status) {
		Query query = this.em().createQuery("from User a where a.status=:status");
		query.setParameter("status", status);
		List<User> users = (List<User>) query.getResultList();
		return users;
	}

	@Override
	public List<User> findByPassword(String password) {
		Query query = this.em().createQuery("from User a where a.password=:password");
		query.setParameter("password", password);
		List<User> users = (List<User>) query.getResultList();
		return users;
	}

	@Override
	public User findById(String id) {
		Query query = this.em().createQuery("from User a where a.id=:id");
		query.setParameter("id", id);
		User users =  (User) query.getSingleResult();
		return users;
	}
	
	



}
