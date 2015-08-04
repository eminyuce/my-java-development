package org.webflow.service;

import org.webflow.domain.User;

public interface UserService {
	public User createUser();
	public User findUser(String name);
	public void addUser(User user);
	public byte[] getProfilePicture(Object id);
}
