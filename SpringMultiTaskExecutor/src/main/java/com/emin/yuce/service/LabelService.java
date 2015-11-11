package com.emin.yuce.service;


import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.fasterxml.jackson.databind.deser.Deserializers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class LabelService extends BaseService {

    @SimpleDao(Labels.class)
    protected GDao<Labels> labelDao;

    @Autowired
    public LabelLineService labelLineService;



    @Transactional
    @Rollback(false)
    public List<Labels> findAllByName(int storeId,String name){
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("name", name);
        finder.addFilterEqual("storeId", storeId);
        return labelDao.findWithFinder(finder);
    }

    @Transactional
    @Rollback(false)
    public void saveLabels(int storeId,String name, int productId){
        Labels labels = new Labels();
        List<Labels> resultList = findAllByName(storeId, name);
        if(resultList != null && resultList.size()  == 0) {
            labels.setName(name);
            labels.setStoreId(storeId);
            labels.setCreatedDate(new Date());
            labels.setOrdering(1);
            labels.setUpdatedDate(new Date());
            labels.setState(true);
            labels.setParentId(0);
            this.saveOrUpdate(labelDao, labels);
        }else{
            labels = resultList.get(0);
        }

        labelLineService.saveLabelLine(labels.getId(), productId, "product");

    }
}
