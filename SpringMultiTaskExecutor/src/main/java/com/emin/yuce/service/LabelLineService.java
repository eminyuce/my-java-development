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

    public void saveLabelLine(Integer labelId, int itemId, String itemType)
    {
        LabelLines labelLines = new LabelLines();
        labelLines.setItemId(itemId);
        labelLines.setItemType(itemType);
        labelLines.setLabelId(labelId);

        this.saveOrUpdate(labelLineDao,labelLines);

    }
}
