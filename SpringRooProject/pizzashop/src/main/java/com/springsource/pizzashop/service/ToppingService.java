package com.springsource.pizzashop.service;

import com.springsource.pizzashop.domain.Topping;
import java.util.List;

public interface ToppingService {

	public abstract long countAllToppings();


	public abstract void deleteTopping(Topping topping);


	public abstract Topping findTopping(Long id);


	public abstract List<Topping> findAllToppings();


	public abstract List<Topping> findToppingEntries(int firstResult, int maxResults);


	public abstract void saveTopping(Topping topping);


	public abstract Topping updateTopping(Topping topping);

}
