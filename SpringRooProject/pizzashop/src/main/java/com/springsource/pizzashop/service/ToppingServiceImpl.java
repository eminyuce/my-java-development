package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.Topping;
import com.springsource.pizzashop.repository.ToppingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ToppingServiceImpl implements ToppingService {

	@Autowired
    ToppingRepository toppingRepository;

	public long countAllToppings() {
        return toppingRepository.count();
    }

	public void deleteTopping(Topping topping) {
        toppingRepository.delete(topping);
    }

	public Topping findTopping(Long id) {
        return toppingRepository.findOne(id);
    }

	public List<Topping> findAllToppings() {
        return toppingRepository.findAll();
    }

	public List<Topping> findToppingEntries(int firstResult, int maxResults) {
        return toppingRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveTopping(Topping topping) {
        toppingRepository.save(topping);
    }

	public Topping updateTopping(Topping topping) {
        return toppingRepository.save(topping);
    }
}
