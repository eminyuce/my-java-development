package com.springsource.pizzashop.domain;

import com.springsource.pizzashop.repository.PizzaRepository;
import com.springsource.pizzashop.service.PizzaService;
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
public class PizzaIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    private PizzaDataOnDemand dod;

	@Autowired
    PizzaService pizzaService;

	@Autowired
    PizzaRepository pizzaRepository;

	@Test
    public void testCountAllPizzas() {
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = pizzaService.countAllPizzas();
        Assert.assertTrue("Counter for 'Pizza' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindPizza() {
        Pizza obj = dod.getRandomPizza();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = pizzaService.findPizza(id);
        Assert.assertNotNull("Find method for 'Pizza' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Pizza' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllPizzas() {
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = pizzaService.countAllPizzas();
        Assert.assertTrue("Too expensive to perform a find all test for 'Pizza', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Pizza> result = pizzaService.findAllPizzas();
        Assert.assertNotNull("Find all method for 'Pizza' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Pizza' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindPizzaEntries() {
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        long count = pizzaService.countAllPizzas();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Pizza> result = pizzaService.findPizzaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Pizza' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Pizza' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testFlush() {
        Pizza obj = dod.getRandomPizza();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = pizzaService.findPizza(id);
        Assert.assertNotNull("Find method for 'Pizza' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPizza(obj);
        Integer currentVersion = obj.getVersion();
        pizzaRepository.flush();
        Assert.assertTrue("Version for 'Pizza' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testUpdatePizzaUpdate() {
        Pizza obj = dod.getRandomPizza();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = pizzaService.findPizza(id);
        boolean modified =  dod.modifyPizza(obj);
        Integer currentVersion = obj.getVersion();
        Pizza merged = pizzaService.updatePizza(obj);
        pizzaRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Pizza' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }

	@Test
    public void testSavePizza() {
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", dod.getRandomPizza());
        Pizza obj = dod.getNewTransientPizza(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Pizza' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Pizza' identifier to be null", obj.getId());
        pizzaService.savePizza(obj);
        pizzaRepository.flush();
        Assert.assertNotNull("Expected 'Pizza' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeletePizza() {
        Pizza obj = dod.getRandomPizza();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pizza' failed to provide an identifier", id);
        obj = pizzaService.findPizza(id);
        pizzaService.deletePizza(obj);
        pizzaRepository.flush();
        Assert.assertNull("Failed to remove 'Pizza' with identifier '" + id + "'", pizzaService.findPizza(id));
    }
}
