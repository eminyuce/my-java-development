package com.emin.yuce.scheduling;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.core.task.TaskExecutor;

import com.emin.yuce.dao.exception.DaoException;
import com.emin.yuce.dao.impl.GenericDaoHibernateImpl;
import com.emin.yuce.dao.impl.UserDAOImpl;
import com.emin.yuce.model.User;
import com.emin.yuce.task.AlarmConsumerTask;

public class AlarmHandlerJob {
	
	private static final Logger logger = Logger
			.getLogger(AlarmHandlerJob.class);

	private UserDAOImpl userDAOImpl;
	private TaskExecutor taskExecutor;


	public void checkAlarmsFromDB() {
		logger.info("Maximover ana cati  "+Thread.currentThread().getName());
		List<User> list = userDAOImpl.findByPassword("status");
		for (User user : list) {
			//logger.info(user);
			
			taskExecutor.execute(new AlarmConsumerTask(user));
			
			
		}
//		System.out.println("Bitti");
//		
//		User user = new User();
//		user.setAdressFilter("Adress Filter");
//		user.setCommandTimeout(new Integer(20));
//		user.setName("Burcu");
//		user.setDescription("Elit bayan");
//		user.setInactivityTimeout("inactivityTimeout");
//		user.setMustChangedPasswd(false);
//		user.setTimeout(new Integer(2));
//		
//		try {
//			userDAOImpl.save(user);
//		} catch (DaoException e) {
//			System.out.println("Exception");
//			e.printStackTrace();
//			logger.error(e);
//			
//		}
	}

	public void setUserDAOImpl(UserDAOImpl userDAOImpl) {
		this.userDAOImpl = userDAOImpl;
	}
	public void setTaskExecutor(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

}
