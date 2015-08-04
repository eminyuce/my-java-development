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
package com.emin.yuce;

import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emin.yuce.service.TaskExecutorExampleService;



/**
 * Starts the Spring Context and will initialize the Spring Integration routes.
 *
 * @author Emin Y�ce
 * @version 1.0
 *
 */
public final class Main {

    private static final Logger LOGGER = LoggerFactory.getLogger(Main.class);

    private Main() { }

    /**
     * Load the Spring Integration Application Context
     *
     * @param args - command line arguments
     */
    public static void main(final String... args) {

        LOGGER.info("\n========================================================="
                  + "\n                                                         "
                  + "\n          Welcome to Spring Integration!                 "
                  + "\n                                                         "
                  + "\n    For more information please visit:                   "
                  + "\n    http://www.springsource.org/spring-integration       "
                  + "\n                                                         "
                  + "\n=========================================================" );

        final AbstractApplicationContext context =
                new ClassPathXmlApplicationContext("classpath:META-INF/spring/integration/*-context.xml");
        
        LOGGER.info("Starting application");
        TaskExecutorExampleService exampleService = context.getBean(TaskExecutorExampleService.class);
        exampleService.printMessages();
        LOGGER.info("Exiting application...bye.");

        System.exit(0);

    }
}
