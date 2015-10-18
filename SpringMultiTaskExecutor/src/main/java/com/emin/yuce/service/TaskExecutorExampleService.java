package com.emin.yuce.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskExecutor;


public class TaskExecutorExampleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskExecutorExampleService.class);


	private TaskExecutor taskExecutor;

	public TaskExecutorExampleService(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	public void printMessages() {


    }
}