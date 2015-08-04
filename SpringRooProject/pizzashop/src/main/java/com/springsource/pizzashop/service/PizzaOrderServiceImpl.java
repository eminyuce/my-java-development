package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.PizzaOrder;
import com.springsource.pizzashop.domain.PizzaOrderPk;
import com.springsource.pizzashop.repository.PizzaOrderRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class PizzaOrderServiceImpl implements PizzaOrderService {

	@Autowired
    PizzaOrderRepository pizzaOrderRepository;

	public long countAllPizzaOrders() {
        return pizzaOrderRepository.count();
    }

	public void deletePizzaOrder(PizzaOrder pizzaOrder) {
        pizzaOrderRepository.delete(pizzaOrder);
    }

	public PizzaOrder findPizzaOrder(PizzaOrderPk id) {
        return pizzaOrderRepository.findOne(id);
    }

	public List<PizzaOrder> findAllPizzaOrders() {
        return pizzaOrderRepository.findAll();
    }

	public List<PizzaOrder> findPizzaOrderEntries(int firstResult, int maxResults) {
        return pizzaOrderRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void savePizzaOrder(PizzaOrder pizzaOrder) {
        pizzaOrderRepository.save(pizzaOrder);
    }

	public PizzaOrder updatePizzaOrder(PizzaOrder pizzaOrder) {
        return pizzaOrderRepository.save(pizzaOrder);
    }
}
