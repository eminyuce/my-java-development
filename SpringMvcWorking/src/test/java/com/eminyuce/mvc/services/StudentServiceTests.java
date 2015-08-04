package com.eminyuce.mvc.services;

import com.eminyuce.mvc.genericDao.GDao;
import com.eminyuce.mvc.genericDao.SimpleDao;
import com.eminyuce.mvc.models.Mobile;
import com.eminyuce.mvc.models.Student;
import com.eminyuce.mvc.util.Finder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class StudentServiceTests {

    @SimpleDao(Student.class)
    private GDao<Student> studentGDao;

    @Autowired
    private StudentService studentService;

    @Test
    public void testFindAllStudents() throws Exception {
        List<Student> studentList = studentService.getAllStudents();
        for (Student s : studentList ){
            System.out.println(s.getAddress());
        }
    }
    @Test
    public void testFindAllMobiles() throws Exception {
        List<Mobile> mobileList = studentService.getMobileList();
        for (Mobile m : mobileList ){
            System.out.println(m.getAddress());
        }
    }
    @Test
    public void testFindAddress() throws Exception {
        // ApplicationContext context = new ClassPathXmlApplicationContext(
        //        new String[]{"classpath:applicationContext.xml"});
        // ßStudentService studentService = (StudentService) context.getBean("studentService");
        studentService.findStudentByAddress("organize sanayi");
    }

    @Test
    public void testMert() throws Exception {
        List<Student> studentsList = studentGDao.findAll();
        for (Student s : studentsList ){
            System.out.println(s);
        }
    }

    @Test
    @Rollback(false)
    public void testInsertStudent() throws Exception {
        Student student = new Student();
        student.setAddress("kozyatagi");
        student.setNumber(11);
        studentGDao.save(student);
    }



    @Test
    public void testFindWithFinderUnique() throws Exception{
        Finder finder = new Finder();
        finder.addFilterEqual("id", 5);
        Student student = studentGDao.findWithFinderUnique(finder);
        System.out.println(student);
    }



    @Test
    public void testFindByColumn() throws Exception {
        List<Student> studentList = studentGDao.findByColumn("address", "kozyatagi");

    }

    @Test
    public void testFindByColumn2() throws Exception {
        List<Student> studentList = studentGDao.findByColumn("number", 123);
    }
}

