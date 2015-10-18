package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BrandService {

    @SimpleDao(Brands.class)
    private GDao<Brands> brandDao;

    public int count(){
        return brandDao.count();
    }
}
