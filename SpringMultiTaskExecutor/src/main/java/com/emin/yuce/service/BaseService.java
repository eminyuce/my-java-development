package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by EMIN on 10/18/2015.
 */



@Service
@Transactional
public  class BaseService {


    protected static final Logger LOGGER = LoggerFactory.getLogger(BaseService.class);



    protected  <T> void saveOrUpdate(GDao<T> dao, T brands)   {
        try {
            dao.saveOrUpdate(brands);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(),e);
        }
    }
}
