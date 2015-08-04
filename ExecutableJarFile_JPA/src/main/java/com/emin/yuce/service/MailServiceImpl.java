package com.emin.yuce.service;

/**
 * Created by IntelliJ IDEA.
 * User: bcetin
 * Date: Dec 15, 2010
 * Time: 3:10:04 PM
 * To change this template use File | Settings | File Templates.
 */

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

public class MailServiceImpl {

	private static Logger log = Logger.getLogger("netsight");

	private List<String> strAddressList;
	private List<String> strCCAddressList;
	private String subject;
	private String textContent;
	private String fileAttachmentPath;
	private String userName = "maximozorlucenter";
	private String password = "AlcatelZorlu04";

	public MailServiceImpl() {

	}

	public MailServiceImpl(ArrayList<String> toAddressList,
			List<String> ccAddressList, String subject, String textContent) {
		this.strAddressList = toAddressList;
		this.strCCAddressList = ccAddressList;
		this.subject = subject;
		this.textContent = textContent;
	}

	public MailServiceImpl(ArrayList<String> toAddressList, String subject,
			List<String> ccAddressList, String textContent,
			String attachmentPath) {
		this.strAddressList = toAddressList;
		this.strCCAddressList = ccAddressList;
		this.subject = subject;
		this.textContent = textContent;
		this.fileAttachmentPath = attachmentPath;
	}

	public void sendMail() throws Exception {
		sendMail(false);
	}

	public void sendMail(boolean deleteAttachment) throws Exception {

		Properties props = new Properties();
		/*
		 * props.put("mail.smtp.host",
		 * "143.209.238.34");//props.put("mail.smtp.host", "mail.alcatel.com");
		 * props.put("mail.smtp.port", "25"); props.put("mail.smtp.auth",
		 * "false");
		 */
		// gmail icin eklendi
		/*          

		Properties systemSettings = System.getProperties();
		systemSettings.put("proxySet", "true");
		systemSettings.put("http.proxyHost", "138.203.144.49");
		systemSettings.put("http.proxyPort", "1080");
		 */
		System.setProperty("java.net.useSystemProxies", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "true");
		String internetAddress = "maximozorlucenter@gmail.com";

		Authenticator auth = new SMTPAuthenticator();

		Session session = Session.getInstance(props, auth);
		session.setDebug(true);

		try {
			MimeMessage m = new MimeMessage(session);
			m.setFrom(new InternetAddress(internetAddress));

			List<Address> toAddressList = new ArrayList<Address>();
			for (String address : strAddressList) {
				toAddressList.add(new InternetAddress(address));
			}
			m.setRecipients(Message.RecipientType.TO, toAddressList
					.toArray(new InternetAddress[toAddressList.size()]));

			if (strCCAddressList != null && strCCAddressList.size() != 0) {
				List<Address> ccAddressList = new ArrayList<Address>();
				for (String address : strCCAddressList) {
					ccAddressList.add(new InternetAddress(address));
				}
				m.setRecipients(Message.RecipientType.CC, ccAddressList
						.toArray(new InternetAddress[ccAddressList.size()]));
			}

			m.setSubject(subject);
			m.setSentDate(new Date());

			// create the message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();

			// fill message
			messageBodyPart.setText(textContent, "utf-8");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			// Part two is attachment
			if (fileAttachmentPath != null && !"".equals(fileAttachmentPath)) {
				messageBodyPart = new MimeBodyPart();
				DataSource source = new FileDataSource(fileAttachmentPath);
				messageBodyPart.setDataHandler(new DataHandler(source));
				messageBodyPart.setFileName(fileAttachmentPath);
				multipart.addBodyPart(messageBodyPart);
			}
			m.setContent(multipart);
			log.info("sending message");
			Transport.send(m);
		} catch (javax.mail.MessagingException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (deleteAttachment
					&& (fileAttachmentPath != null && !""
							.equals(fileAttachmentPath))) {
				File f = new File(fileAttachmentPath);
				if (f.exists()) {
					f.delete();
				}
			}
		}
	}

	public List<String> getStrAddressList() {
		return strAddressList;
	}

	public void setStrAddressList(List<String> strAddressList) {
		this.strAddressList = strAddressList;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public String getFileAttachmentPath() {
		return fileAttachmentPath;
	}

	public void setFileAttachmentPath(String fileAttachmentPath) {
		this.fileAttachmentPath = fileAttachmentPath;
	}

	public List<String> getStrCCAddressList() {
		return strCCAddressList;
	}

	public void setStrCCAddressList(List<String> strCCAddressList) {
		this.strCCAddressList = strCCAddressList;
	}

	private class SMTPAuthenticator extends Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, password);
		}

		SMTPAuthenticator() {
		}
	}
}