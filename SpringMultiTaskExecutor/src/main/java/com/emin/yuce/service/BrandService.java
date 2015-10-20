package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import com.jcabi.aspects.Cacheable;
import com.shopstyle.bo.Brand;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@Transactional
public class BrandService extends BaseService {

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();

    @SimpleDao(Brands.class)
    public GDao<Brands> brandDao;

    @Transactional
    public Integer count(){

        return brandDao.count();
    }
    public void removeCache(int storeId){
        String key="findAllBrands-"+storeId;
        simpleCacheManager.clear(key);
    }
    @Transactional
    public  List<Brands> findAllByStoreId(int storeId){

        String key="findAllBrands-"+storeId;
        List<Brands> items = (List<Brands>) simpleCacheManager.get(key);
        if(items == null){
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("storeId", storeId);
            items = brandDao.findWithFinder(finder);
            simpleCacheManager.put(key,items);
        }
        return items;
    }

    @Transactional

    public List<Brands> findBrandsByBrandCode(int storeId, String brandCode) throws Exception {
        List<Brands> items = this.findAllByStoreId(storeId);
        List<Brands> results = new ArrayList<Brands>();

        for (Brands p : items){
            if(p.getBrandCode().equals(brandCode)){
                results.add(p);
            }
        }

        return results;

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
