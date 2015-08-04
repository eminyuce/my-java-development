package com.emin.yuce;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ContentGatheringMain {

    private static final Logger logger = Logger
            .getLogger(ContentGatheringMain.class);
    public static void main(String[] args) {
        logger.info ("App context is initializing");
        try {
            ClassPathXmlApplicationContext ctx = new
                    ClassPathXmlApplicationContext("classpath:/META-INF/spring/app-context.xml");
        } catch (BeansException e) {
            logger.error(e);
        }
        
    }
}
