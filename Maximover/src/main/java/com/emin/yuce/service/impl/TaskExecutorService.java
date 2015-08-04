package com.emin.yuce.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskExecutor;

import com.emin.yuce.task.AlarmConsumerTask;

public class TaskExecutorService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskExecutorService.class);

	   
	private TaskExecutor taskExecutor;

	public TaskExecutorService(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	public void printMessages() {
		LOGGER.info(Thread.currentThread().getName()+" ---------------------------------");
		for (int i = 0; i < 250; i++) {
			taskExecutor.execute(new AlarmConsumerTask(null));
		}
	}
}