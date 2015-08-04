package com.bday.notifier.pojos;
/**
 * @author nyadav
 * 
 */

import java.util.Date;

public class User {

	private String email;
	private String name;
	private Date date;

	public User(String name, String email, Date date) {
		super();
		this.email = email;
		this.name = name;
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
