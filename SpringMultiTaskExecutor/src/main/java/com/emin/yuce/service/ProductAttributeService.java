package com.emin.yuce.service;


import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.ProductAttributes;
import com.emin.yuce.models.ProductFiles;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ProductAttributeService extends BaseService{


    @Autowired
    public ProductAttributeRelationService productAttributeRelationService;

    @SimpleDao(ProductAttributes.class)
    protected GDao<ProductAttributes> productAttributeDao;

    @Transactional
    @Rollback(false)
    public List<ProductAttributes> findAllByProductName(int storeId,String name){
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        finder.addFilterEqual("name", name);
        return productAttributeDao.findWithFinder(finder);
    }

    @Transactional
    @Rollback(false)
    public void SaveAttribute(int storeId,String name, int productId,String value){

        if(name == null){
            return;
        }
        ProductAttributes productAttributes = new ProductAttributes();
        List<ProductAttributes> resultList = findAllByProductName(storeId,name);
        if(resultList != null && resultList.size()  == 0) {
            productAttributes.setName(name);
            productAttributes.setComponentType("textbox");
            productAttributes.setDefaultValue(value);
            productAttributes.setIsSearchable(false);
            productAttributes.setIsFilterable(false);
            productAttributes.setIsRequired(false);
            productAttributes.setIsEndUserOnly(false);
            productAttributes.setStoreId(storeId);
            productAttributes.setCreatedDate(new Date());
            productAttributes.setOrdering(1);
            productAttributes.setUpdatedDate(new Date());
            productAttributes.setState(true);

            this.saveOrUpdate(productAttributeDao, productAttributes);
        }else{
            productAttributes = resultList.get(0);
        }

        productAttributeRelationService.saveProductAttributeRelations(productAttributes.getId(),productId,value);

    }
}
