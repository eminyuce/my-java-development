package org.webflow.service;

import java.util.List;

import javax.faces.model.SelectItem;

import org.webflow.domain.Product;
import org.webflow.domain.ProductType;


public interface ProductManager {
	public Product getProduct();
	public Product getProduct(Object id);
	public List<Product> getProducts();
	public List<ProductType> getProductTypes();
	public List<SelectItem> getProductTypesItemList();
	public ProductType getProductType(Object id);
	public List<Product> getProducts(ProductType productType);
	public Product saveProduct(Product prod);
	public void deleteProduct(Product prod);
	public void deleteProduct(int id);
	public void deleteSelectedProduct(List<Product> selectedProduct);
	public Product editProduct(Product prod);
	
}
