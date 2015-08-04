package com.emin.yuce.scheduling;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.emin.yuce.dao.impl.UserDAOImpl;
import com.emin.yuce.model.User;

public class EmailJob extends QuartzJobBean {

	private static final Logger logger = Logger
			.getLogger(EmailJob.class);
	
	private int timeout;
	private UserDAOImpl userDAOImpl;

	/**
	 * Setter called after the ExampleJob is instantiated with the value from
	 * the JobDetailBean (5)
	 */
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	protected void executeInternal(JobExecutionContext ctx)
			throws JobExecutionException {
		logger.info("EmailJob is invoked.Time out : "+timeout);
		try {
			List<User> list = userDAOImpl.findByPassword("status");
			for (User user : list) {
				logger.info(user);
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		
		
	}

	public void setUserDAOImpl(UserDAOImpl userDAOImpl) {
		this.userDAOImpl = userDAOImpl;
	}
}
