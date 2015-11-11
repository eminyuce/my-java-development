package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Products;
import com.emin.yuce.models.Retailers;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import com.shopstyle.bo.Retailer;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Yuce on 10/22/2015.
 */

@Service
@Transactional
public class RetailerService extends BaseService {

    @SimpleDao(Retailers.class)
    protected GDao<Retailers> retailerDao;

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();

    public void removeCache(int storeId){
        String key="findAllRetailers-"+storeId;
        simpleCacheManager.clear(key);
    }
    @Transactional
    @Rollback(false)
    public  List<Retailers> findAllByStoreId(int storeId){
        String key="findAllRetailers-"+storeId;
        List<Retailers> items = (List<Retailers>) simpleCacheManager.get(key);
        if(items == null){
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("storeId", storeId);
            items = retailerDao.findWithFinder(finder);
            simpleCacheManager.put(key,items);
        }
        return items;
    }
    @Transactional
    @Rollback(false)
    public List<Retailers> findRetailersByProductCode(int storeId, String retailerCode) throws Exception {
        List<Retailers> items = this.findAllByStoreId(storeId);
        List<Retailers> results = new ArrayList<Retailers>();
        for (Retailers p : items){
            if(p.getRetailerCode() != null && p.getRetailerCode().equals(retailerCode)){
                results.add(p);
            }
        }
        return results;

    }


    @Transactional
    @Rollback(false)
    public Retailers SaveRetailers(int storeId,String retailerId,String name, String url) {
        Retailers item = new Retailers();

        List<Retailers>  resultList = null;
        try {
            resultList = findRetailersByProductCode(storeId, retailerId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(resultList != null && resultList.size()  == 0) {

            item.setName(name);
            item.setCreatedDate(new Date());
            item.setOrdering(1);
            item.setUpdatedDate(new Date());
            item.setStoreId(storeId);
            item.setState(true);
            item.setRetailerUrl(url);
            item.setRetailerCode(retailerId);

            this.saveOrUpdate(this.retailerDao, item);

        }else{
            item =resultList.get(0);
        }
        return item;
    }
}
