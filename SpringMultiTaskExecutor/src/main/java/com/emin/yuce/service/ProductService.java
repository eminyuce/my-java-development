package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.GDaoImpl;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;

import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import com.shopstyle.bo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class ProductService  extends BaseService {

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();
    @SimpleDao(Products.class)
    protected GDao<Products> productDao;

    @Autowired
    public BrandService brandService;


    @Autowired
    public FileManagerService fileManagerService;

    public void removeCache(int storeId){
        String key="findAllProducts-"+storeId;
        simpleCacheManager.clear(key);
    }
    @Transactional
    public  List<Products> findAllByStoreId(int storeId){
        String key="findAllProducts-"+storeId;
        List<Products> items = (List<Products>) simpleCacheManager.get(key);
        if(items == null){
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("storeId", storeId);
            items = productDao.findWithFinder(finder);
            simpleCacheManager.put(key,items);
        }
        return items;
    }
    @Transactional
    public List<Products> findProductsByProductCode(int storeId, String productCode) throws Exception {
        List<Products> items = this.findAllByStoreId(storeId);
        List<Products> results = new ArrayList<Products>();
        for (Products p : items){
             if(p.getProductCode().equals(productCode)){
                results.add(p);
            }
        }
        return results;

    }


    @Transactional
    public Products saveProduct(int storeId,
                                Product product,
                                Integer categoryId,
                                Brand brand)  {
        Products item = new Products();
        List<Products> productResultList = null;
        try {
            productResultList = findProductsByProductCode(storeId, product.getId()+"");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(productResultList != null && productResultList.size()  == 0) {
            item.setProductCategoryId(categoryId);
            item.setName(product.getName());
            item.setCreatedDate(new Date());
            item.setDescription(product.getDescription());
            item.setPrice(product.getPrice());
            item.setOrdering(1);
            item.setUpdatedDate(new Date());
            item.setStoreId(storeId);
            item.setState(true);
            item.setMainPage(true);
            item.setType("product");
            item.setProductCode(product.getId() + "");
            item.setImageState(true);
            item.setTotalRating(1);
            item.setUnitsInStock(10);
            item.setVideoUrl(product.getClickUrl());




            try {
                if(brand != null){
                    List<Brands> list = brandService.findBrandsByBrandCode(storeId, brand.getId() + "");
                    if (list.size() > 0) {
                        item.setBrandId(list.get(0).getId());
                    }else{
                        item.setBrandId(0);
                    }
                }else{
                    item.setBrandId(-2);
                }


            } catch (Exception e) {

                item.setBrandId(-1);
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                String exceptionAsString = sw.toString();
                LOGGER.error(exceptionAsString,e);
                e.printStackTrace();
            }


            this.saveOrUpdate(this.productDao, item);


            try {


                Image image = product.getImage();
                String imageId = image.getId();
                fileManagerService.SaveFileManagers(storeId,image,item);

            }    catch (Exception e) {


                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                String exceptionAsString = sw.toString();
                LOGGER.error(exceptionAsString,e);
                e.printStackTrace();
            }
        }else{
            item = productResultList.get(0);
        }
        return item;


    }



}


