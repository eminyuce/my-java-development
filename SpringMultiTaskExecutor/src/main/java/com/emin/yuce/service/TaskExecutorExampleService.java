package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;

import com.emin.yuce.Main;
import com.emin.yuce.task.MessagePrinterTask;

public class TaskExecutorExampleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskExecutorExampleService.class);

    @Autowired
    public BrandService brandService;

	private TaskExecutor taskExecutor;

	public TaskExecutorExampleService(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	public void printMessages() {
        System.out.println("brand service count: "+brandService.count());
        LOGGER.info("brand service count:"+  brandService.count());

    }
}