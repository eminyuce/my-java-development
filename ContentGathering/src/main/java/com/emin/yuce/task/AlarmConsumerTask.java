package com.emin.yuce.task;

import com.emin.yuce.model.User;

public class AlarmConsumerTask implements Runnable {

	private User myUser;

	public AlarmConsumerTask(User myUser) {
		this.myUser = myUser;
	}

	public void run() {
		System.out.println(Thread.currentThread().getName()+":"+this.myUser);
	}

}