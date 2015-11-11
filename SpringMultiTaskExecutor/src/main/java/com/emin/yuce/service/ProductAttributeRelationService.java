package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductAttributeRelationService extends BaseService{

    @SimpleDao(ProductAttributeRelations.class)
    protected GDao<ProductAttributeRelations> productAttributeRelationDao;

    @Transactional
    @Rollback(false)
    public List<ProductAttributeRelations> findAllByProductAttributeRelations(int productAttributeId,int productId,String value){
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("productAttributeId", productAttributeId);
        finder.addFilterEqual("productId", productId);
        finder.addFilterEqual("productAttributeValue", value);
        return productAttributeRelationDao.findWithFinder(finder);
    }
    @Transactional
    @Rollback(false)
    public void saveProductAttributeRelations(int productAttributeId,int productId,String value)
    {
        List<ProductAttributeRelations> resultList = findAllByProductAttributeRelations(productAttributeId,productId,value);
        if(resultList != null && resultList.size()  == 0) {
            ProductAttributeRelations attributeRelations = new ProductAttributeRelations();
            attributeRelations.setProductAttributeId(productAttributeId);
            attributeRelations.setProductAttributeValue(value);
            attributeRelations.setProductId(productId);
            this.saveOrUpdate(productAttributeRelationDao, attributeRelations);
        }else{

        }
    }
}
