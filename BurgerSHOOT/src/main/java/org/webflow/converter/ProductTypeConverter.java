package org.webflow.converter;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.validator.ValidatorException;

import org.springframework.web.jsf.FacesContextUtils;
import org.webflow.domain.ProductType;
import org.webflow.service.ProductManager;

public class ProductTypeConverter implements Converter {
	
	private ProductManager productManager;
	
	public ProductTypeConverter() {
	
		ProductManager productManager = FacesContextUtils.getWebApplicationContext(	FacesContext.getCurrentInstance()).getBean(ProductManager.class);
		setProductManager(productManager);
	}
	
	public void setProductManager(ProductManager productManager) {
		this.productManager=productManager;
	}
	
	
	@Override
	public Object getAsObject(FacesContext context, UIComponent component,
			String value) {
		int id=0;
		try {
			id = Integer.parseInt(value);
		} catch (Exception e) {
			FacesMessage message = new FacesMessage();
			message.setDetail("Unable to convert string "+value+" into integer!");
			message.setSummary("Unable to convert string "+value+" into integer!");
			throw new ValidatorException(message);
		}
		
		ProductType productType = productManager.getProductType(id);
		if(productType==null){
			FacesMessage facesMessage = new FacesMessage();
			facesMessage.setDetail("No Product type with id:"+id+"!");
			facesMessage.setSummary("No Product type with id:"+id+"!");
			throw new ConverterException(facesMessage);
		}
		
		return productType;
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component,
			Object value) {
		ProductType productType = (ProductType) value;
		
		return String.valueOf(productType.getFldid());
	}

}
