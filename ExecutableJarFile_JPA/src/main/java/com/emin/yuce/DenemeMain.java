package com.emin.yuce;

import org.springframework.beans.BeansException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DenemeMain {
    public static void main(String[] args) {
        System.out.println("App context is initializing");
        try {
//            ClassPathXmlApplicationContext ctx = new
//                    ClassPathXmlApplicationContext("classpath:/META-INF/spring/app-context.xml");

        
            System.out.println("OVERRR");
            
        } catch (BeansException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        
    }
}
