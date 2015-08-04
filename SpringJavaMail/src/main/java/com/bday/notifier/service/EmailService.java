package com.bday.notifier.service;

/**
 * @author nyadav
 * 
 */

import com.bday.notifier.comp.Attachment;
import com.bday.notifier.pojos.Email;
import com.bday.notifier.pojos.User;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmailService {
	private JavaMailSenderImpl mailSender = null;
	private VelocityEngine velocityEngine;

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public void sendEmail(Email email) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		// use the true flag to indicate you need a multipart message
		boolean hasAttachments = (email.getAttachments() != null && email
				.getAttachments().size() > 0);
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,
				hasAttachments);
		helper.setTo(email.getTo());
		helper.setFrom(email.getFrom());
		helper.setSubject(email.getSubject());
		helper.setText(email.getText(), true);

		List<Attachment> attachments = email.getAttachments();
		if (attachments != null && attachments.size() > 0) {
			for (Attachment attachment : attachments) {
				String filename = attachment.getFilename();
				DataSource dataSource = new ByteArrayDataSource(
						attachment.getData(), attachment.getMimeType());
				if (attachment.isInline()) {
					helper.addInline(filename, dataSource);
				} else {
					helper.addAttachment(filename, dataSource);
				}
			}
		}

		mailSender.send(mimeMessage);
	}

	public void sendVelocityEmail(final User user) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(user.getEmail());
				message.setFrom("Bdayadmin@gmail.com");
				message.setSubject(MessageFormat.format("Happy BirthDay {0}",
						user.getName()));
				Map model = new HashMap();
				model.put("user", user);
				String text = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "com/bday/velocity/bday.vm", model);
				message.setText(text, true);
			}
		};
		this.mailSender.send(preparator);
	}
}