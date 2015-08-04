package com.eminyuce.mvc.controller;

import com.eminyuce.mvc.models.Mobile;
import com.eminyuce.mvc.models.Student;
import com.eminyuce.mvc.services.MobileService;
import com.eminyuce.mvc.services.StudentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class HelloController {


    private static final Logger LOGGER = LoggerFactory.getLogger(HelloController.class);

    @Autowired
    private StudentService studentService;

    @Autowired
    private MobileService mobileService;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

        List<Student> studentList = new ArrayList<Student>();

        try {
            studentList = studentService.getAllStudents();
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error("Error",e);
            studentList = new ArrayList<Student>();
        }
        List<Mobile> mobileList = new ArrayList<Mobile>();

        try {
            mobileList = mobileService.getMobileList();
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error("Error",e);
        }


        model.addAttribute("mobiles",mobileList);
        model.addAttribute("students",studentList);
        model.addAttribute("message", "Hello world!");
        return "hello/hello";
	}

    @RequestMapping(value = "/hi",method = RequestMethod.GET)
    public String printWelcome2(ModelMap model) {

        List<Mobile> mobileList = new ArrayList<Mobile>();

        try {
            mobileList = mobileService.getMobileList();
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.error("Error",e);
        }


        model.addAttribute("mobiles",mobileList);
        model.addAttribute("message", "Hi World!");
        return "hello/hello";
    }
}