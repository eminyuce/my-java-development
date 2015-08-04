package com.emin.yuce.scheduling;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emin.yuce.dao.exception.DaoException;
import com.emin.yuce.dao.impl.UserDAOImpl;
import com.emin.yuce.model.User;

@Service("alarmHandlerJob")
public class AlarmHandlerJob {
	
	private static final Logger logger = Logger
			.getLogger(AlarmHandlerJob.class);

	@Autowired
	private UserDAOImpl userDAOImpl;

	public void checkAlarmsFromDB() {
		System.out.println("Emin");
	}
}
