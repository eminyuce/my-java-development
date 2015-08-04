/*
 * Copyright 2002-2010 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.alcatel.lucent;

import java.util.List;
import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Starts the Spring Context and will initialize the Spring Integration routes.
 * 
 * @author Gunnar Hillert
 * @version 1.0
 * 
 */
public final class Main {

	private static final Logger LOGGER = LoggerFactory.getLogger(Main.class);

	private Main() {
	}

	/**
	 * Load the Spring Integration Application Context
	 * 
	 * @param args
	 *            - command line arguments
	 */
	public static void main(final String... args) {

		LOGGER.info("\n========================================================="
				+ "\n                                                         "
				+ "\n          Welcome to Spring Integration!                 "
				+ "\n                                                         "
				+ "\n    For more information please visit:                   "
				+ "\n    http://www.springsource.org/spring-integration       "
				+ "\n                                                         "
				+ "\n=========================================================");

		final AbstractApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:META-INF/spring/integration/*-context.xml");

		Hesaplama hesaplamaImpl = context.getBean(HesaplamaImpl.class);
		System.out.println(hesaplamaImpl.topla(10, 15));

		HesaplamaImpl hesaplamaImpl2 = (HesaplamaImpl) hesaplamaImpl;
		System.out.println(hesaplamaImpl2.useKarakok(625));

		HesaplamaImpl hesaplamaImpl4 = hesaplamaImpl2;
		System.out.println(hesaplamaImpl4.cikarma(10, 4));

		System.out.println("Bitti.");
		System.out
				.println("\n=========================================================");

		CustomerService custA = context.getBean(CustomerService.class);
		custA.setMessage("Message by custA");
		System.out.println("Message : " + custA.getMessage());

		// retrieve it again
		CustomerService custB = context.getBean(CustomerService.class);
		System.out.println("Message : " + custB.getMessage());
		
		if(custA.equals(custB)){
			System.out.println("ESITTIR");
		}else{
			System.out.println("AHH YALAN DUNYA");
		}

		Customer customer = (Customer) context.getBean("customerObject");
		customer.getMessage();
	}
}
