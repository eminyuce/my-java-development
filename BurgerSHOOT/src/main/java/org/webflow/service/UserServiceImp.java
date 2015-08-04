package org.webflow.service;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.webflow.domain.Authority;
import org.webflow.domain.User;

@Service("userService")
@Repository
public class UserServiceImp implements UserService, Serializable {

	private static final long serialVersionUID = 1L;

	private EntityManager em;

	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	@Override
	@Transactional(readOnly=true)
	public User createUser() {
		User user  = new User();
		return user;
	}

	@Override
	@Transactional(readOnly=true)
	public User findUser(String name) {
		return em.find(User.class, name);
	}

	@Override
	@Transactional(readOnly=true)
	public void addUser(User user) {
		Authority authority = new Authority();
		authority.setUser(user);
		authority.setAuthority("ROLE_USER");
		user.setEnabled((byte) 1);
		em.persist(user);
		em.persist(authority);
	}

	@Override
	public byte[] getProfilePicture(Object id) {
		User user = em.find(User.class, "ali");
		byte[] dd=user.getImage();
		for (int i = 0; i < dd.length && i<100; i++) {
			System.out.print(dd[i]);
		}
		return user.getImage();
	}

}
