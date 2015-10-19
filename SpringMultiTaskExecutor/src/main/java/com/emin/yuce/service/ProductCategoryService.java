package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Categories;
import com.emin.yuce.models.ProductCategories;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class ProductCategoryService extends BaseService {

    @SimpleDao(ProductCategories.class)
    protected GDao<ProductCategories> productCategoryDao;

    public ProductCategories saveProductCategory(int storeId, String name, String parentId) {
        ProductCategories item = new ProductCategories();

        item.setName(name);
        item.setCreatedDate(new Date());
        item.setDescription(parentId);
        item.setOrdering(1);
        item.setUpdatedDate(new Date());
        item.setStoreId(storeId);
        item.setState(true);
        this.saveOrUpdate(this.productCategoryDao,item);

        return item;
    }

}
