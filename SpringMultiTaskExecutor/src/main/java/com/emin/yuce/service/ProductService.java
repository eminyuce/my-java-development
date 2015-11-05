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
public class ProductService extends BaseService {

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();
    @SimpleDao(Products.class)
    protected GDao<Products> productDao;

    @Autowired
    public ProductAttributeService productAttributeService;

    @Autowired
    public BrandService brandService;

    @Autowired
    public LabelService labelService;


    @Autowired
    public RetailerService retailerService;

    @Autowired
    public ProductAttributeRelationService productAttributeRelationService;


    @Autowired
    public FileManagerService fileManagerService;

    public void removeCache(int storeId) {
        String key = "findAllProducts-" + storeId;
        simpleCacheManager.clear(key);

    }

    @Transactional
    public List<Products> findAllByStoreId(int storeId) {
        String key = "findAllProducts-" + storeId;
        List<Products> items = (List<Products>) simpleCacheManager.get(key);
        if (items == null) {
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("storeId", storeId);
            items = productDao.findWithFinder(finder);
            simpleCacheManager.put(key, items);
        }
        return items;
    }

    @Transactional
    public List<Products> findProductsByProductCode(int storeId, String productCode) throws Exception {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        List<Products> items = productDao.findWithFinder(finder);
        List<Products> results = new ArrayList<Products>();
        for (Products p : items) {
            if (p.getProductCode().equals(productCode)) {
                results.add(p);
            }
        }
        return results;

    }


    @Transactional
    public Products saveProduct(int storeId,
                                Product product,
                                Integer categoryId,
                                Brand brand, Retailer retailer) {
        Products item = new Products();
        List<Products> productResultList = null;
        try {
            productResultList = findProductsByProductCode(storeId, product.getId() + "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (productResultList != null && productResultList.size() == 0) {
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
            item.setTotalRating(2);
            item.setUnitsInStock(10);
            item.setVideoUrl(product.getClickUrl());


            setProductRetailers(storeId, retailer, item);

            try {
                if (brand != null) {
                    List<Brands> list = brandService.findBrandsByBrandCode(storeId, brand.getId() + "");
                    if (list.size() > 0) {
                        item.setBrandId(list.get(0).getId());
                    } else {
                        item.setBrandId(0);
                    }
                } else {
                    item.setBrandId(-2);
                }


            } catch (Exception e) {

                item.setBrandId(-1);
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                String exceptionAsString = sw.toString();
                LOGGER.error(exceptionAsString, e);
                e.printStackTrace();
            }


            this.saveOrUpdate(this.productDao, item);


        } else {
            item = productResultList != null ? productResultList.get(0) : null;
            if (item != null) {
                setProductRetailers(storeId, retailer, item);
                item.setProductCategoryId(categoryId);
                item.setPrice(product.getPrice());
                this.saveOrUpdate(this.productDao, item);
            }
        }


        try {


            Image image = product.getImage();
            String imageId = image.getId();
            fileManagerService.SaveFileManagers(storeId, image, item);

        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            LOGGER.error(exceptionAsString, e);
            e.printStackTrace();
        }


        try {


            int productAttributesId = productAttributeService.findAllByProductName(storeId, "Color").get(0).getId();

            ProductColor[] pColor = product.getColors();

            for (ProductColor p : pColor) {
                Image m = p.getImage();
                String wUrl = p.getSwatchUrl();
                Color[] colors = p.getCanonicalColors();
                String name = p.getName();
                for (Color c : colors) {
                 //   System.out.println(c.getName());
                    productAttributeRelationService.saveProductAttributeRelations(productAttributesId, item.getId(), c.getName());
                }
            }

            productAttributesId = productAttributeService.findAllByProductName(storeId, "Size").get(0).getId();

            ProductSize[] pSize = product.getSizes();
            for (ProductSize p : pSize) {
                String name = p.getName();
                productAttributeRelationService.saveProductAttributeRelations(productAttributesId, item.getId(), name);
            }

        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            LOGGER.error(exceptionAsString, e);
            e.printStackTrace();
        }


        try {


            String labelsText = product.getSeeMoreLabel();
//            if (labelsText != null) {
//                labelService.saveLabels(storeId, labelsText, item.getId());
//            }


        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            LOGGER.error(exceptionAsString, e);
            e.printStackTrace();
        }

        return item;

    }

    private boolean setProductRetailers(int storeId, Retailer retailer, Products item) {
        try {
            if (retailer != null) {
                List<Retailers> list = retailerService.findRetailersByProductCode(storeId, retailer.getId() + "");
                if (list.size() > 0) {
                    item.setRetailerId(list.get(0).getId());

                    return true;
                } else {
                    item.setRetailerId(0);
                }
            } else {
                item.setRetailerId(-2);
            }


        } catch (Exception e) {

            item.setRetailerId(-1);
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            LOGGER.error(exceptionAsString, e);
            e.printStackTrace();
        }

        return false;


    }


}


