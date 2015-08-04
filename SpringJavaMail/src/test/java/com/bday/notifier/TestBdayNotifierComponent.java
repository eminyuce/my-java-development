package com.bday.notifier;

/*
*@author nyadav
*@Last update 5/07/2011
*/

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bday.notifier.pojos.Email;
import com.bday.notifier.pojos.User;
import com.bday.notifier.service.EmailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/applicationContext-test.xml" })
public class TestBdayNotifierComponent {
/**/
	private EmailService emailService;

	@Autowired
	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}

	@Before
	public void setUp() {
		
	}

	@Test
	public void testSendMail() {

		System.out.println("Sending Birthday Wishes... ");
		List<User> usersBornToday = getUsersBornToday();
		for (User user : usersBornToday) {
			try {
				Email email = new Email();
				email.setFrom("eminyuce@gmail.com");
				email.setSubject(MessageFormat.format("Happy BirthDay Mr.{0}",
						user.getName()));
				email.setTo(user.getEmail());
				email.setText(encodeToHtml(user.getName()));
				emailService.sendEmail(email);
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@After
	public void tearDown() {
		// execute "tear down" logic within the method
	}

	private List<User> getUsersBornToday() {
		List<User> users = new ArrayList<User>();
		User user1 = new User("Neeraj", "eminyuce@gmail.com",
				new Date());
		users.add(user1);
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
