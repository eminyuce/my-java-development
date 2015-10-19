package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.shopstyle.bo.Brand;
import com.shopstyle.bo.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@Transactional
public class BrandService extends BaseService {


    @SimpleDao(Brands.class)
    protected GDao<Brands> brandDao;


    public Integer count(){

        return brandDao.count();
    }



    public List<Brands> findBrandsByBrandCode(int storeId, String brandCode) throws Exception {
        List<Brands> items = brandDao.findAll();


        Stream<Brands> personsOver18 = items.stream().filter(p ->
                p.getBrandCode() == brandCode &&
                        p.getStoreId()  == storeId);


        return  personsOver18.collect(Collectors.toList());
    }



    public List<Brands> findBrandsByName(int storeId,String name, String description) {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        finder.addFilterEqual("name", name);
        if(description != null && description != ""){
            finder.addFilterEqual("description", description);
        }


        return brandDao.findWithFinder(finder);
    }


    public Brands SaveBrand(int storeId,Brand brand) {
        Brands brands = new Brands();
        List<Brands> brandList = null;
        try {
            brandList = findBrandsByBrandCode(storeId, brand.getId()+"");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(brandList != null && brandList.size()  == 0){
            brands.setName(brand.getName());
            brands.setCreatedDate(Date.from(Instant.now()));
            brands.setDescription(brand.getUrl());
            brands.setOrdering(1);
            brands.setUpdatedDate(Date.from(Instant.now()));
            brands.setStoreId(storeId);
            brands.setState(true);
            brands.setBrandCode(brand.getId() + "");
            this.saveOrUpdate(this.brandDao, brands);
        }else{
            brands = brandList.get(0);
        }
        return brands;
    }
}
