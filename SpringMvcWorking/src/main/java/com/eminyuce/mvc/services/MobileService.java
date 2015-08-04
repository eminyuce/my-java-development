package com.eminyuce.mvc.services;

import com.eminyuce.mvc.genericDao.GDao;
import com.eminyuce.mvc.genericDao.SimpleDao;
import com.eminyuce.mvc.models.Mobile;
import com.eminyuce.mvc.models.Student;
import com.eminyuce.mvc.util.Finder;
import com.eminyuce.mvc.util.FinderFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MobileService {

    @SimpleDao(Mobile.class)
    private GDao<Mobile> mobileDao;

    public MobileService() {

    }
    @Transactional
    public void saveOrUpdate(Mobile mobile) throws Exception {
        mobileDao.saveOrUpdate(mobile);
    }
    @Transactional
    public List<Mobile> getMobileList() throws Exception {
        return mobileDao.findAll();
    }
    @Transactional
    public Mobile findWithFinderUnique(Finder finder) {
        return mobileDao.findWithFinderUnique(finder);
    }
    @Transactional
    public List<Mobile> findWithFinder(Finder finder) {
        return mobileDao.findWithFinder(finder);
    }

}