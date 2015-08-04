package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.Pizza;
import com.springsource.pizzashop.repository.PizzaRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class PizzaServiceImpl implements PizzaService {

	@Autowired
    PizzaRepository pizzaRepository;

	public long countAllPizzas() {
        return pizzaRepository.count();
    }

	public void deletePizza(Pizza pizza) {
        pizzaRepository.delete(pizza);
    }

	public Pizza findPizza(Long id) {
        return pizzaRepository.findOne(id);
    }

	public List<Pizza> findAllPizzas() {
        return pizzaRepository.findAll();
    }

	public List<Pizza> findPizzaEntries(int firstResult, int maxResults) {
        return pizzaRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void savePizza(Pizza pizza) {
        pizzaRepository.save(pizza);
    }

	public Pizza updatePizza(Pizza pizza) {
        return pizzaRepository.save(pizza);
    }
}
