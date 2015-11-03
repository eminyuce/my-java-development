package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.ProductFiles;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
@Transactional
public class ProductFileService extends BaseService {


    @SimpleDao(ProductFiles.class)
    public GDao<ProductFiles> productFilesDao;


    @Transactional
    public List<ProductFiles> findAllByProductId(int productId) {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("productId", productId);
        List<ProductFiles> items = productFilesDao.findWithFinder(finder);
        if (items == null) {
            return new ArrayList<ProductFiles>();
        }

        return items;
    }

    @Transactional
    public void saveOrUpdateAllProductFiles(Collection<ProductFiles> productFilesCollection) {
        productFilesDao.saveOrUpdateAll(productFilesCollection);
    }

}
