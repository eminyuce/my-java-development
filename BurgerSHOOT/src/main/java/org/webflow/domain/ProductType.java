package org.webflow.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the producttype database table.
 * 
 */
@Entity
@Table(name="producttype")
public class ProductType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int fldid;

	@Column(length=100,unique=true)
	private String fldname;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="producttype")
	private Set<Product> products;

    public ProductType() {
    }

	public int getFldid() {
		return this.fldid;
	}

	public void setFldid(int fldid) {
		this.fldid = fldid;
	}

	public String getFldname() {
		return this.fldname;
	}

	public void setFldname(String fldname) {
		this.fldname = fldname;
	}

	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(!(obj instanceof ProductType))return false;
		
		return (((ProductType)obj).getFldid()==this.getFldid());
	}
	
}