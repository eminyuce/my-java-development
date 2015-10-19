package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;

import com.shopstyle.bo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;


@Service
@Transactional
public class ProductService  extends BaseService {

    @SimpleDao(Products.class)
    protected GDao<Products> productDao;

    @Autowired
    public BrandService brandService;


    public Products saveProduct(int storeId,
                                Product product,
                                Integer categoryId,
                                Brand brand)
    {
        Products item = new Products();

        item.setProductCategoryId(categoryId);
        item.setName(product.getName());
        item.setCreatedDate(new Date());
        item.setDescription(product.getDescription());
        item.setOrdering(1);
        item.setUpdatedDate(new Date());
        item.setStoreId(storeId);
        item.setState(true);
        this.saveOrUpdate(this.productDao, item);
        return item;


    }



}


