package com.bday.notifier.job;

/*
 *@author nyadav
 *@Last update 5/07/2011
 */

import com.bday.notifier.pojos.User;
import com.bday.notifier.service.EmailService;
import com.bday.notifier.util.LoadFromProperty;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

public class BirthdayWisherJob extends QuartzJobBean {

	private EmailService emailService;

	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}

	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		System.out.println("Sending Birthday Wishes... ");
		List<User> usersBornToday = getUsersBornToday();
		for (User user : usersBornToday) {
			try {
				emailService.sendVelocityEmail(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private List<User> getUsersBornToday() {
		List<User> users = new ArrayList<User>();
		users = new LoadFromProperty().getAllNotifiableUsers();
		return users;
	}

	private String encodeToHtml(String name) {
		Object[] params = new Object[] { name };
		String htmlTxt = MessageFormat
				.format("<h1 style=background-color:DarkSalmon;>Dear {0},<br /> <br />"
						+ "Many Many Happy <br />Returns of the day <br /> :-)<br /><br /><br /><br /><br /><br /><br /><br /><br />Regards,<br />Base Infra Team</h1>",
						params);
		return htmlTxt;
	}
}
