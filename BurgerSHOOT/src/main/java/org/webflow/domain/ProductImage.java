package org.webflow.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the productimage database table.
 * 
 */
@Entity
@Table(name="productimage")
public class ProductImage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int fldid;

    @Lob()
	private byte[] fldimage;

	@Column(length=100)
	private String fldname;

	@Column(length=10)
	private String fldtype;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="productimage")
	private Set<Product> products;

    public ProductImage() {
    }

	public int getFldid() {
		return this.fldid;
	}

	public void setFldid(int fldid) {
		this.fldid = fldid;
	}

	public byte[] getFldimage() {
		return this.fldimage;
	}

	public void setFldimage(byte[] fldimage) {
		this.fldimage = fldimage;
	}

	public String getFldname() {
		return this.fldname;
	}

	public void setFldname(String fldname) {
		this.fldname = fldname;
	}

	public String getFldtype() {
		return this.fldtype;
	}

	public void setFldtype(String fldtype) {
		this.fldtype = fldtype;
	}

	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
}