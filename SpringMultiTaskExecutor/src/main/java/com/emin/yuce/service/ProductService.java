package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Date;


@Service
@Transactional
public class ProductService  extends BaseService {

    @SimpleDao(Products.class)
    protected GDao<Products> productDao;

    public Products saveProduct(int storeId, String name, String description) {
        Products item = new Products();

        item.setName(name);
        item.setCreatedDate(Date.from(Instant.now()));
        item.setDescription(description);
        item.setOrdering(1);
        item.setUpdatedDate(Date.from(Instant.now()));
        item.setStoreId(storeId);
        item.setState(true);
        this.saveOrUpdate(this.productDao,item);

        return item;
    }
}


