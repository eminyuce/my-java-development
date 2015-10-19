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
import java.util.List;


@Service
@Transactional
public class ProductService  extends BaseService {

    @SimpleDao(Products.class)
    protected GDao<Products> productDao;

    @Autowired
    public BrandService brandService;

    @Transactional
    public Products saveProduct(int storeId,
                                Product product,
                                Integer categoryId,
                                Brand brand)  {
        Products item = new Products();

        item.setProductCategoryId(categoryId);
        item.setName(product.getName());
        item.setCreatedDate(new Date());
        item.setDescription(product.getDescription());
        item.setPrice(product.getPrice());
        item.setOrdering(1);
        item.setUpdatedDate(new Date());
        item.setStoreId(storeId);
        item.setState(true);
        item.setMainPage(true);
        item.setType("product");
        item.setProductCode(product.getId()+"");
        item.setImageState(true);
        item.setTotalRating(1);
        item.setUnitsInStock(99);
        item.setVideoUrl(product.getClickUrl());


        try {
            List<Brands> list = brandService.findBrandsByBrandCode(storeId, brand.getId() + "");
            if(list.size() > 0){
                item.setBrandId(list.get(0).getId());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        this.saveOrUpdate(this.productDao, item);
        return item;


    }



}


