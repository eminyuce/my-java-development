package org.webflow.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.webflow.domain.Product;
import org.webflow.domain.ProductType;

@Service("orderService")
public class OrderServiceImp implements OrderService{
	
	private ProductManager productManager;
	
	@Override
	public List<Product> getProducts(ProductType type) {
		return productManager.getProducts(type);
	}

	@Override
	public void buyProducts(List<Product> products) {
	}
	
}
