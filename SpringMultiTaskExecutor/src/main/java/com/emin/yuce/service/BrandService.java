package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.shopstyle.bo.Brand;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BrandService extends BaseService {


    @SimpleDao(Brands.class)
    public GDao<Brands> brandDao;

    @Transactional
    public Integer count(){

        return brandDao.count();
    }


    @Transactional
    public List<Brands> findBrandsByBrandCode(int storeId, String brandCode) throws Exception {
//        List<Brands> items = brandDao.findAll();
//
//
//        Stream<Brands> personsOver18 = items.stream().filter(p ->
//                p.getBrandCode() == brandCode &&
//                        p.getStoreId()  == storeId);
//
//
//        return  personsOver18.collect(Collectors.toList());

        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        finder.addFilterEqual("brandCode", brandCode);

        return brandDao.findWithFinder(finder);
    }


    @Transactional
    public List<Brands> findBrandsByName(int storeId,String name, String description) {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        finder.addFilterEqual("name", name);
        if(description != null && description != ""){
            finder.addFilterEqual("description", description);
        }


        return brandDao.findWithFinder(finder);
    }

    @Transactional
    public Brands SaveBrand(int storeId,String brandId,String name, String url) {
        Brands brands = new Brands();
        List<Brands> brandList = null;
        try {
            brandList = findBrandsByBrandCode(storeId, brandId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(brandList != null && brandList.size()  == 0){
            brands.setName(name);
            brands.setCreatedDate(new Date());
            brands.setDescription(url);
            brands.setOrdering(1);
            brands.setUpdatedDate(new Date());
            brands.setStoreId(storeId);
            brands.setState(true);
            brands.setBrandCode(brandId);
            this.saveOrUpdate(this.brandDao, brands);
        }else{
            brands = brandList.get(0);
        }
        return brands;
    }
}
