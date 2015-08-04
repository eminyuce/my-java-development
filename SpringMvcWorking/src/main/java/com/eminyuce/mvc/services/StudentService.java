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

/**
 * Created by EMINYUCE on 12/26/13.
 */
@Service
@Transactional
public class StudentService {

    @SimpleDao(Student.class)
    private GDao<Student> studentDao;

    @SimpleDao(Mobile.class)
    private GDao<Mobile> mobileDao;

    public StudentService() {
    }
    @Transactional
    public List<Student> getAllStudents() throws Exception {
        return studentDao.findAll();
    }
    @Transactional
    public List<Mobile> getMobileList() throws Exception {
        return mobileDao.findAll();
    }
    @Transactional
    public List<Student> findStudentByAddress(String adress) {
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("mobile.address.address", adress);
        return studentDao.findWithFinder(finder);
    }
}