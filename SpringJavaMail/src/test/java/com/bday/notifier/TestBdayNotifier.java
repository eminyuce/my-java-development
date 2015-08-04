package com.bday.notifier;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestBdayNotifier {
    @Test
	public static void test(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"classpath:applicationContext.xml");
	}

}
