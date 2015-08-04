package com.springsource.pizzashop.domain;

import com.springsource.pizzashop.repository.BaseRepository;
import com.springsource.pizzashop.service.BaseService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml")
@Transactional
@Configurable
public class BaseIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    private BaseDataOnDemand dod;

	@Autowired
    BaseService baseService;

	@Autowired
    BaseRepository baseRepository;

	@Test
    public void testCountAllBases() {
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", dod.getRandomBase());
        long count = baseService.countAllBases();
        Assert.assertTrue("Counter for 'Base' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindBase() {
        Base obj = dod.getRandomBase();
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Base' failed to provide an identifier", id);
        obj = baseService.findBase(id);
        Assert.assertNotNull("Find method for 'Base' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Base' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllBases() {
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", dod.getRandomBase());
        long count = baseService.countAllBases();
        Assert.assertTrue("Too expensive to perform a find all test for 'Base', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Base> result = baseService.findAllBases();
        Assert.assertNotNull("Find all method for 'Base' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Base' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindBaseEntries() {
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", dod.getRandomBase());
        long count = baseService.countAllBases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Base> result = baseService.findBaseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Base' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Base' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Base obj = dod.getRandomBase();
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Base' failed to provide an identifier", id);
        obj = baseService.findBase(id);
        Assert.assertNotNull("Find method for 'Base' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyBase(obj);
        Integer currentVersion = obj.getVersion();
        baseRepository.flush();
        Assert.assertTrue("Version for 'Base' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateBaseUpdate() {
        Base obj = dod.getRandomBase();
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Base' failed to provide an identifier", id);
        obj = baseService.findBase(id);
        boolean modified =  dod.modifyBase(obj);
        Integer currentVersion = obj.getVersion();
        Base merged = baseService.updateBase(obj);
        baseRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Base' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveBase() {
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", dod.getRandomBase());
        Base obj = dod.getNewTransientBase(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Base' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Base' identifier to be null", obj.getId());
        baseService.saveBase(obj);
        baseRepository.flush();
        Assert.assertNotNull("Expected 'Base' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteBase() {
        Base obj = dod.getRandomBase();
        Assert.assertNotNull("Data on demand for 'Base' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Base' failed to provide an identifier", id);
        obj = baseService.findBase(id);
        baseService.deleteBase(obj);
        baseRepository.flush();
        Assert.assertNull("Failed to remove 'Base' with identifier '" + id + "'", baseService.findBase(id));
    }
}
