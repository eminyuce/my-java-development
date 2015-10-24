package com.emin.yuce.service;


import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.ProductAttributes;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductAttributeService extends BaseService{

    @SimpleDao(ProductAttributes.class)
    protected GDao<ProductAttributes> productAttributeDao;


}
