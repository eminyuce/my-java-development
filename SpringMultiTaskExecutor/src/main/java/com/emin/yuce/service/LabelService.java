package com.emin.yuce.service;


import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;
import com.fasterxml.jackson.databind.deser.Deserializers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LabelService extends BaseService {

    @SimpleDao(Labels.class)
    protected GDao<Labels> labelDao;

}
