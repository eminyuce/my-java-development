package com.emin.yuce.scheduling;

import java.util.List;

import javax.persistence.Column;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.emin.yuce.dao.impl.UserDAOImpl;
import com.emin.yuce.model.User;

public class AlarmHandlerJob {

	private static final Logger logger = Logger
			.getLogger(AlarmHandlerJob.class);

	@Autowired
	private UserDAOImpl userDAOImpl;

	public void checkAlarmsFromDB() {
		


		    
		User user = new User();
		user.setAdressFilter("Adress Filter");
		user.setCommandTimeout(new Integer(20));
		user.setName("emin");
		user.setDescription("Elit adam");
		user.setInactivityTimeout("inactivityTimeout");
		user.setMustChangedPasswd(false);
		user.setTimeout(new Integer(2));
		user.setUseGlobalCommandTimeout(false);
		user.setLocked(false);
		user.setLoginMessage("Login MEssage");
		user.setMaxConcurrentSessions(new Integer(2));
		user.setNoPasswordExpiration(false);
		user.setPassword("password");
		user.setUseGlobalLoginMessage(false);
		user.setUseInternalDbAuth(false);
		
		try {
			userDAOImpl.persist(user);
			System.out.println("Kayit");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}
