package com.emin.yuce.service;

import com.emin.yuce.models.Brands;
import com.shopstyle.api.*;
import com.shopstyle.bo.Category;
import com.shopstyle.bo.Product;
import com.shopstyle.bo.Retailer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Date;

/**
 * Created by EMIN on 10/18/2015.
 */
@Service
public class ShopStyleApiService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ShopStyleApiService.class);

    @Autowired
    public BrandService brandService;


    public  void writeApiToDatabase() {
        ShopStyle api = new ShopStyle("uid121-30959989-77");
        ProductQuery query = new ProductQuery().withFreeText("red dresses");
        ProductSearchResponse response = null;
        try {
            response = api.getProducts(query);

            LOGGER.info("Total Prodcut Count="+response.getProducts().length);
            ProductHistogramResponse histograms = api.getProductsHistogram(query, Category.class, Retailer.class);
            CategoryHistogramEntry[] categoryHistogram = histograms.getCategoryHistogram();
            RetailerHistogramEntry[] retailerHistogram = histograms.getRetailerHistogram();


        } catch (ShopStyle.APIException e) {
            e.printStackTrace();
        }
        for (Product product : response.getProducts()) {
            System.out.println(product.getName());
            LOGGER.info(product.getName());

            Brands brands = new Brands();

            brands.setName(product.getName());
            brands.setCreatedDate(Date.from(Instant.now()));
            brands.setDescription("test");
            brands.setOrdering(1);
            brands.setUpdatedDate(Date.from(Instant.now()));
            brands.setStoreId(1);
            brands.setState(true);
            brandService.saveOrUpdate(brands);
        }
    }
}
