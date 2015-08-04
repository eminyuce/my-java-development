package org.webflow.domain;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the authorities database table.
 * 
 */
@Entity
@Table(name="authorities")
public class Authority implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String authority;

	//bi-directional many-to-one association to User
    @ManyToOne
	@JoinColumn(name="username")
	private User user;

    public Authority() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAuthority() {
		return this.authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}