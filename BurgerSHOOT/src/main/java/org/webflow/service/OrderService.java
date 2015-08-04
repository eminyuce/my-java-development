package org.webflow.service;

import java.util.List;

import org.webflow.domain.Product;
import org.webflow.domain.ProductType;

public interface OrderService {
	public List<Product> getProducts(ProductType type);
	public void buyProducts(List<Product> products);
}
