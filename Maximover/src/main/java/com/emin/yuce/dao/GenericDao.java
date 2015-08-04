package com.emin.yuce.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.emin.yuce.dao.exception.DaoException;

public interface GenericDao <T, Id extends Serializable> {

	public T get(Id objectId) throws DaoException;

    public void delete(Id objectId) throws DaoException;

    public Id save(T object) throws DaoException;

    public void saveOrUpdate(T object) throws DaoException;

    public void saveOrUpdateAll(Collection<T> entityList) throws DaoException;

    public void update(T object) throws DaoException;

    public void delete(T object) throws DaoException;

    public List<T> findAll() throws DaoException;
}