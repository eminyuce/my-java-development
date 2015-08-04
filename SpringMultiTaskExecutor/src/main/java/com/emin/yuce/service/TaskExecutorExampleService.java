package com.emin.yuce.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskExecutor;

import com.emin.yuce.Main;
import com.emin.yuce.task.MessagePrinterTask;

public class TaskExecutorExampleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskExecutorExampleService.class);

	   
	private TaskExecutor taskExecutor;

	public TaskExecutorExampleService(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	public void printMessages() {
		LOGGER.info(Thread.currentThread().getName()+" ---------------------------------");
		for (int i = 0; i < 250; i++) {
			taskExecutor.execute(new MessagePrinterTask("Message" + i));
		}
	}
}