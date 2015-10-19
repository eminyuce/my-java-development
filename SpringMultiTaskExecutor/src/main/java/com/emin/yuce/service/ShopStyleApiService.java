package com.emin.yuce.service;

import com.emin.yuce.models.Brands;
import com.emin.yuce.models.ProductCategories;
import com.shopstyle.api.*;
import com.shopstyle.bo.Brand;
import com.shopstyle.bo.Category;
import com.shopstyle.bo.Product;
import com.shopstyle.bo.Retailer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;


/**
 * Created by EMIN on 10/18/2015.
 */
@Service
@Transactional
public class ShopStyleApiService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ShopStyleApiService.class);

    @Autowired
    public BrandService brandService;

    @Autowired
    public ProductService productService;


    @Autowired
    public ProductCategoryService productCategoryService;

    @Transactional
    public void writeApiToDatabase() {

        int storeId=2;
        ShopStyle api = new ShopStyle("uid121-30959989-77");
        ProductQuery pp = new ProductQuery();



        ProductSearchResponse response = null;
        try {

            BrandListResponse brandListResponse  =   api.getBrands();
            for (Brand b: brandListResponse.getBrands()) {
                Brands brandItem = brandService.SaveBrand(storeId, b.getId()+"",b.getName(),b.getUrl());
            }
            Category oo = null;
            CategoryListResponse categoryListResponse = api.getCategories(oo, 0);
            Category[] cats = categoryListResponse.getCategories();
            LOGGER.info("Total Categories " + cats.length);
            for (Category c : cats) {

                ProductCategories productCategories = productCategoryService.saveProductCategory(storeId, c.getName(), c.getParentId());
                LOGGER.info(productCategories.getId() + " " + c.getName());
                ProductQuery query = pp.withCategory(c);
                response = api.getProducts(query);
                for (Product product : response.getProducts()) {
                    System.out.println(product.getName());
                    productService.saveProduct(storeId,product,
                            productCategories.getId(),
                            product.getBrand());

                    LOGGER.info(product.getName());
                    LOGGER.info("Total product Count=" + response.getProducts().length);
                    ProductHistogramResponse histograms = api.getProductsHistogram(query, Category.class, Retailer.class,Brand.class);
                    CategoryHistogramEntry[] categoryHistogram = histograms.getCategoryHistogram();
                    RetailerHistogramEntry[] retailerHistogram = histograms.getRetailerHistogram();
                    BrandHistogramEntry [] brandHistogram = histograms.getBrandHistogram();


                }


            }


        } catch (ShopStyle.APIException e) {
            e.printStackTrace();
        }

    }


}
