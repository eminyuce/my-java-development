package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.ProductFiles;
import com.emin.yuce.util.SimpleCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductFileService {

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();

    @SimpleDao(ProductFiles.class)
    public GDao<ProductFiles> productFilesDao;

    @Transactional
    public Integer count(){
        return productFilesDao.count();
    }

}
