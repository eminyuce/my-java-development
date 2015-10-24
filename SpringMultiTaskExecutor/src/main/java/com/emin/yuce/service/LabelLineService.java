package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class LabelLineService extends BaseService {

    @SimpleDao(LabelLines.class)
    protected GDao<LabelLines> labelLineDao;

}
