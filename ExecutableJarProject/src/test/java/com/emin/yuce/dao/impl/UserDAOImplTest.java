/**
 * 
 */
package com.emin.yuce.dao.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.emin.yuce.model.User;

/**
 * @author eminy
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/com/emin/yuce/OrderPersistenceTests-context.xml"})
public class UserDAOImplTest {

	@Autowired
	private UserDAOImpl userDAOImpl;
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.emin.yuce.dao.impl.UserDAOImpl#findByName(java.lang.String)}.
	 */
	@Test
	public void testFindByName() {
		fail("Not yet implemented"); // TODO
	}

	/**
	 * Test method for {@link com.emin.yuce.dao.impl.UserDAOImpl#findByPassword(java.lang.String)}.
	 */
	@Test
	public void testFindByPassword() {
		@SuppressWarnings("unchecked")
		List<User> users = userDAOImpl.findByPassword("status");
		for (User user : users) {
			System.out.println(user);
		}
	}

}
