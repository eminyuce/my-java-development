package org.webflow.util;

import java.util.ArrayList;
import java.util.List;

import javax.faces.component.html.HtmlDataTable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.webflow.domain.Product;

@Component("jsfTableAvailableProducts")
@Scope("session")
public class JSFDataTableAvailableProducts {
	List<Product> products;
	List<Boolean> selected;
	HtmlDataTable dataTable;
	
	public JSFDataTableAvailableProducts() {
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) throws Exception {
		if(products==null)throw new Exception("Products list is null!");
		this.products = products;
		selected = new ArrayList<Boolean>();
	}

	public List<Boolean> getSelected() {
		return selected;
	}

	public void setSelected(List<Boolean> selected) {
		this.selected = selected;
	}

	public HtmlDataTable getDataTable() {
		return dataTable;
	}

	public void setDataTable(HtmlDataTable dataTable) {
		this.dataTable = dataTable;
	}
	
}
