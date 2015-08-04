package com.alcatel.lucent.daoImpl;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.alcatel.lucent.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-module-context.xml" })
public class UserDaoImplTest {

	@Autowired
	private UserDaoImpl userDao;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreate() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testDeleteEntity() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	@Transactional
	public void testFetchAll() {

		try {
			List<User> userList = userDao.fetchAll();
			for (User user : userList) {
				System.out.println(user);
			}
			System.out.println("OVER");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
