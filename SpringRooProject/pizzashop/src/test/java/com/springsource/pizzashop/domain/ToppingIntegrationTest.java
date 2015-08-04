package com.springsource.pizzashop.domain;

import com.springsource.pizzashop.repository.ToppingRepository;
import com.springsource.pizzashop.service.ToppingService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml")
@Transactional
public class ToppingIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    private ToppingDataOnDemand dod;

	@Autowired
    ToppingService toppingService;

	@Autowired
    ToppingRepository toppingRepository;

	@Test
    public void testCountAllToppings() {
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", dod.getRandomTopping());
        long count = toppingService.countAllToppings();
        Assert.assertTrue("Counter for 'Topping' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindTopping() {
        Topping obj = dod.getRandomTopping();
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topping' failed to provide an identifier", id);
        obj = toppingService.findTopping(id);
        Assert.assertNotNull("Find method for 'Topping' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Topping' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllToppings() {
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", dod.getRandomTopping());
        long count = toppingService.countAllToppings();
        Assert.assertTrue("Too expensive to perform a find all test for 'Topping', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Topping> result = toppingService.findAllToppings();
        Assert.assertNotNull("Find all method for 'Topping' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Topping' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindToppingEntries() {
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", dod.getRandomTopping());
        long count = toppingService.countAllToppings();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Topping> result = toppingService.findToppingEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Topping' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Topping' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Topping obj = dod.getRandomTopping();
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topping' failed to provide an identifier", id);
        obj = toppingService.findTopping(id);
        Assert.assertNotNull("Find method for 'Topping' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTopping(obj);
        Integer currentVersion = obj.getVersion();
        toppingRepository.flush();
        Assert.assertTrue("Version for 'Topping' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdateToppingUpdate() {
        Topping obj = dod.getRandomTopping();
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topping' failed to provide an identifier", id);
        obj = toppingService.findTopping(id);
        boolean modified =  dod.modifyTopping(obj);
        Integer currentVersion = obj.getVersion();
        Topping merged = toppingService.updateTopping(obj);
        toppingRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Topping' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSaveTopping() {
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", dod.getRandomTopping());
        Topping obj = dod.getNewTransientTopping(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Topping' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Topping' identifier to be null", obj.getId());
        toppingService.saveTopping(obj);
        toppingRepository.flush();
        Assert.assertNotNull("Expected 'Topping' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteTopping() {
        Topping obj = dod.getRandomTopping();
        Assert.assertNotNull("Data on demand for 'Topping' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topping' failed to provide an identifier", id);
        obj = toppingService.findTopping(id);
        toppingService.deleteTopping(obj);
        toppingRepository.flush();
        Assert.assertNull("Failed to remove 'Topping' with identifier '" + id + "'", toppingService.findTopping(id));
    }
}
