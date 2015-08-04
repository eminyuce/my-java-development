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
import org.springframework.transaction.annotation.Transactional;

import com.emin.yuce.dao.CityDAO;
import com.emin.yuce.model.report.CityReportBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/emin/yuce/OrderPersistenceTests-context.xml" })
public class CityDAOImplTest {

	@Autowired
	private CityDAO cityDAO;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Transactional
	public void testGetReport() {
		try {
			List<CityReportBean> list = cityDAO.getReport("");
			for (CityReportBean cityReportBean : list) {
				System.out.println(cityReportBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
