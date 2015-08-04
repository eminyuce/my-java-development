package com.eminyuce.mvc.services;

import com.eminyuce.mvc.genericDao.GDao;
import com.eminyuce.mvc.genericDao.SimpleDao;
import com.eminyuce.mvc.models.Address;
import com.eminyuce.mvc.models.Mobile;
import com.eminyuce.mvc.models.Student;
import com.eminyuce.mvc.util.Finder;
import com.eminyuce.mvc.util.FinderFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Random;


@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class MobileServiceTests {

    @Autowired
    private MobileService mobileService;

    @Autowired
    private AddressService addressService;

    @Test
    public void testFindAllMobile() throws Exception {
        List<Mobile> mobileList = mobileService.getMobileList();
        for (Mobile s : mobileList ){
            System.out.println(s);
        }
    }

    @Test
    public void testFindWithFinderUniqueMobile() throws Exception{
        Finder finder = new Finder();
        finder.addFilterEqual("id", 5);
        Mobile mobile = mobileService.findWithFinderUnique(finder);
        System.out.println(mobile);
    }

    @Test
    public void testFindWithFinderUniqueMobiles() throws Exception{
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("address.address","5830 43rd Avenue");
        List<Mobile> mobileList = mobileService.findWithFinder(finder);
        for (int i = 0; i < mobileList.size(); i++) {
            Mobile mobile =  mobileList.get(i);
            System.out.println("Mobile="+mobile);
        }
    }


    @Test
    @Rollback(false)
    public void testInsertMobile() throws Exception {

        Random random = new Random();

        Address address = new Address();
        address.setAddress("5830 43rd Avenue "+random.nextInt());
        addressService.saveOrUpdate(address);

        Mobile mobile = new Mobile();
        mobile.setMobileNo(random.nextInt());
        mobile.setAddress(address);
        mobileService.saveOrUpdate(mobile);
    }


}