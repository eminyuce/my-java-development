package com.eminyuce.mvc.services;

import com.eminyuce.mvc.genericDao.GDao;
import com.eminyuce.mvc.genericDao.SimpleDao;
import com.eminyuce.mvc.models.Address;
import com.eminyuce.mvc.models.Mobile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by EMINYUCE on 12/29/13.
 */
@Service
@Transactional
public class AddressService {


    @SimpleDao(Address.class)
    private GDao<Address> addressDao;


    public void saveOrUpdate(Address address) throws Exception {
        addressDao.saveOrUpdate(address);
    }

}
