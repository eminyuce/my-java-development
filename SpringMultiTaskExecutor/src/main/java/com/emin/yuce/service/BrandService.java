package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BrandService extends BaseService {


    @SimpleDao(Brands.class)
    protected GDao<Brands> brandDao;


    public Integer count(){

        return brandDao.count();
    }



    public List<Brands> getAllBrands() throws Exception {
        return brandDao.findAll();
    }



    public List<Brands> findBrandsByName(String name) {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("mobile.address.address", name);
        return brandDao.findWithFinder(finder);
    }

    public void saveOrUpdate(Brands brands)   {
        try {
            brandDao.saveOrUpdate(brands);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(),e);
        }
    }
}
