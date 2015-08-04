package com.emin.yuce.task;

public class MessagePrinterTask implements Runnable {

	private String message;

	public MessagePrinterTask(String message) {
		this.message = message;
	}

	public void run() {
		System.out.println(Thread.currentThread().getName()+":"+message);
	}

}