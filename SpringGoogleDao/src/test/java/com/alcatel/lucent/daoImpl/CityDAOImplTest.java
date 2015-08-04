/**
 * 
 */
package com.alcatel.lucent.daoImpl;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alcatel.lucent.dao.CityDAO;
import com.alcatel.lucent.model.City;
import com.alcatel.lucent.model.report.CityReportBean;

/**
 * @author eminy
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-module-context.xml" })
public class CityDAOImplTest {

	@Autowired
	private CityDAO cityDAO;

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
	 * Test method for
	 * {@link com.googlecode.genericdao.dao.hibernate.original.GenericDAOImpl#fetchAll()}
	 * .
	 */
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testFetchAll() {

		try {

			List<City> list = cityDAO.fetchAll();
			for (City city : list) {
				System.out.println(city);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testfindCityByCountryCode() {

		try {

			List<CityReportBean> list = cityDAO.findCityByCountryCode("NLD");
			for (CityReportBean city : list) {
				System.out.println(city);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testgetCity() {

		try {

			List<City> list = cityDAO.findCitybyName("");
			for (City city : list) {
				System.out.println(city);
			}
			System.out.println("OVERR");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testStoredProc() {

		try {
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			List<City> list = cityDAO.callStoredProcedure("Amsterdam");
			for (City city : list) {
				System.out.println(city);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("OVERRR");

	}
	
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testStoredProc2() {

		try {
			List<City> list = cityDAO.callStoredProcedure2("AFG");
			for (City city : list) {
				System.out.println(city);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("OVERRR");

	}
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testfindByPopulation() {

		try {
			List<City> list = cityDAO.findByPopulation("1780000");
			for (City city : list) {
				System.out.println(city);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("OVERRR");

	}
	
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void testStoredProc3() {

		try {
			List<CityReportBean> list = cityDAO.callStoredProcedure3("AFG");
			for (CityReportBean city : list) {
				System.out.println(city);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("OVERRR");

	}
	
}
