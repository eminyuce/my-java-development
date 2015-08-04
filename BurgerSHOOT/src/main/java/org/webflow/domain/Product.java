package org.webflow.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@Table(name="product")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Basic(optional = false)
	@Column(unique=true, nullable=false)
	private int fldid;

	private int calcium;

	private int calorie;

	private int carbohydrate;

	private int cholesterol;

	private int fat;

	private int fiber;

	@Column(length=1000)
	private String flddesc;

	@Column(length=20)
	private String fldname;

	private int iron;

	private int protein;

	private int salt;

	private int sodium;

	private int sugar;

	@Column(name="vit_a")
	private int vitA;

	@Column(name="vit_c")
	private int vitC;

	//bi-directional many-to-one association to Productimage
    @ManyToOne
	@JoinColumn(name="fldimage")
	private ProductImage productimage;

	//bi-directional many-to-one association to Producttype
    @ManyToOne
	@JoinColumn(name="fldtype")
	private ProductType producttype;

    public Product() {
    }

	public int getFldid() {
		return this.fldid;
	}

	public void setFldid(int fldid) {
		this.fldid = fldid;
	}

	public int getCalcium() {
		return this.calcium;
	}

	public void setCalcium(int calcium) {
		this.calcium = calcium;
	}

	public int getCalorie() {
		return this.calorie;
	}

	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}

	public int getCarbohydrate() {
		return this.carbohydrate;
	}

	public void setCarbohydrate(int carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public int getCholesterol() {
		return this.cholesterol;
	}

	public void setCholesterol(int cholesterol) {
		this.cholesterol = cholesterol;
	}

	public int getFat() {
		return this.fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getFiber() {
		return this.fiber;
	}

	public void setFiber(int fiber) {
		this.fiber = fiber;
	}

	public String getFlddesc() {
		return this.flddesc;
	}

	public void setFlddesc(String flddesc) {
		this.flddesc = flddesc;
	}

	public String getFldname() {
		return this.fldname;
	}

	public void setFldname(String fldname) {
		this.fldname = fldname;
	}

	public int getIron() {
		return this.iron;
	}

	public void setIron(int iron) {
		this.iron = iron;
	}

	public int getProtein() {
		return this.protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getSalt() {
		return this.salt;
	}

	public void setSalt(int salt) {
		this.salt = salt;
	}

	public int getSodium() {
		return this.sodium;
	}

	public void setSodium(int sodium) {
		this.sodium = sodium;
	}

	public int getSugar() {
		return this.sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getVitA() {
		return this.vitA;
	}

	public void setVitA(int vitA) {
		this.vitA = vitA;
	}

	public int getVitC() {
		return this.vitC;
	}

	public void setVitC(int vitC) {
		this.vitC = vitC;
	}

	public ProductImage getProductimage() {
		return this.productimage;
	}

	public void setProductimage(ProductImage productimage) {
		this.productimage = productimage;
	}
	
	public ProductType getProducttype() {
		return this.producttype;
	}

	public void setProducttype(ProductType producttype) {
		this.producttype = producttype;
	}

	@Override
	public String toString() {
		return "Product [fldid=" + fldid + ", calcium=" + calcium
				+ ", calorie=" + calorie + ", carbohydrate=" + carbohydrate
				+ ", cholesterol=" + cholesterol + ", fat=" + fat + ", fiber="
				+ fiber + ", flddesc=" + flddesc + ", fldname=" + fldname
				+ ", iron=" + iron + ", protein=" + protein + ", salt=" + salt
				+ ", sodium=" + sodium + ", sugar=" + sugar + ", vitA=" + vitA
				+ ", vitC=" + vitC + ", productimage=" + productimage
				+ ", producttype=" + producttype + "]";
	}

	
}