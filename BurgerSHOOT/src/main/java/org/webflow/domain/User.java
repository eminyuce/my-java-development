package org.webflow.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@NotEmpty(message="Name cannot be empty")
	private String username;
	
	private byte enabled;
	
	@NotEmpty(message="Password cannot be empty")
	private String password;
	
	
	@NotEmpty
	@Email(message="Value maust be a valid email.")
	private String email;
	
	@NotNull(message="Enter a valid date of birth.")
	private Date dob;
	
    @Lob()
	private byte[] image;
	
	//bi-directional many-to-one association to Authority
	@OneToMany(mappedBy="user")
	private Set<Authority> authorities;

    public User() {
    }

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Authority> getAuthorities() {
		return this.authorities;
	}

	public void setAuthorities(Set<Authority> authorities) {
		this.authorities = authorities;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getDob() {
		return dob;
	}

	public void setImage(byte[] image) {
		this.image = image;
		System.out.println("Image Data:"+image[0]+image[1]+image[2]+image[3]+".");
	}

	public byte[] getImage() {
		return image;
	}
	
}