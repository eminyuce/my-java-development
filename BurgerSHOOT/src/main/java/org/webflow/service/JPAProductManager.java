package org.webflow.service;

import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.webflow.domain.Product;
import org.webflow.domain.ProductType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Transactional;

@Repository("productManager")
public class JPAProductManager implements ProductManager {
	private EntityManager em;

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	@PersistenceContext(name = "bookingDatabase")
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	@Override
	public Product getProduct(Object id) {
		Product product = em.find(Product.class, id);
		return product;
	}

	@Override
	public List<Product> getProducts() {
		List<Product> products = em.createQuery(
				"select object(p) FROM Product p").getResultList();
		return products;
	}

	public List<Product> getProducts(ProductType productType) {
		List<Product> products = em
				.createQuery(
						"select object(p) FROM Product p where p.producttype = ?1")
				.setParameter(1, productType).getResultList();
		return products;
	}

	@Override
	public List<ProductType> getProductTypes() {
		List<ProductType> productTypes = em.createQuery(
				"select object(p) FROM ProductType p").getResultList();
		return productTypes;
	}

	@Override
	public List<SelectItem> getProductTypesItemList() {
		ArrayList<SelectItem> selectItems = new ArrayList<SelectItem>();
		List<ProductType> ptypes = getProductTypes();
		for (ProductType productType : ptypes) {
			selectItems.add(new SelectItem(productType, productType
					.getFldname()));
			
			
		}

		return selectItems;
	}

	public ProductType getProductType(Object id) {
		return em.find(ProductType.class, id);
	}

	@Transactional(readOnly = true)
	@Override
	public Product saveProduct(Product prod) {
		em.persist(prod);
		logger.info(" Save new Product   ------->  " + prod);
		return prod;
	}

	@Override
	public Product getProduct() {
		Product prod = new Product();
		return prod;
	}

	@Override
	@Transactional
	public void deleteProduct(Product prod) {
		logger.info(" Delete Product  -----> " + prod);
		em.remove(prod);
	}

	@Override
	@Transactional
	public void deleteProduct(int id) {

		try {
			Product prod = getProduct(id);
			logger.info(" Deleting notebook ----> " + prod);
			em.remove(prod);
		} catch (EntityNotFoundException enfe) {
			logger.info(" Deleting notebook EXCEPTION  " + enfe.getMessage());
		}

	}

	
	@Override
	@Transactional
	public void deleteSelectedProduct(List<Product> selectedProduct) {
		for (Product product : selectedProduct) {
			try {

				Product prod = product;
				logger.info(" Deleting notebook ----> " + prod);
				em.remove(prod);

			} catch (EntityNotFoundException enfe) {
				logger.info(" Deleting notebook EXCEPTION  "
						+ enfe.getMessage());
			}
		}

	}
	@Transactional
	@Override
	public Product editProduct(Product prod) {
		logger.info(" Edit Product  -----> " + prod);
		prod = em.merge(prod);
		return prod;
	}

}
