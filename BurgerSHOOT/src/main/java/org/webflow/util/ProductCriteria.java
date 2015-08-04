package org.webflow.util;

import java.io.Serializable;
import java.util.List;

import org.webflow.domain.Product;
import org.webflow.domain.ProductType;

public class ProductCriteria implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	private ProductType productType;
	private List<Product> productList;
	
	
	public ProductType getProductType() {
		return productType;
	}
	public void setProductType(ProductType productType) {
		this.productType = productType;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	
}
