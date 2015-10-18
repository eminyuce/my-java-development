/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emin.yuce.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author EMIN
 */
@Entity
@Table(name = "Products")
public class Products implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "StoreId")
    private Integer storeId;
    @Basic(optional = false)
    @Column(name = "ProductCategoryId", nullable = false)
    private int productCategoryId;
    @Column(name = "BrandId")
    private Integer brandId;
    @Column(name = "ProductCode", length = 50)
    private String productCode;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 500)
    private String name;
    @Column(name = "Description", length = 2147483647)
    private String description;
    @Column(name = "Type", length = 50)
    private String type;
    @Column(name = "MainPage")
    private Boolean mainPage;
    @Column(name = "State")
    private Boolean state;
    @Column(name = "Ordering")
    private Integer ordering;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "ImageState")
    private Boolean imageState;
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Basic(optional = false)
    @Column(name = "Price", nullable = false)
    private double price;
    @Basic(optional = false)
    @Column(name = "Discount", nullable = false)
    private double discount;
    @Column(name = "UnitsInStock")
    private Integer unitsInStock;
    @Column(name = "TotalRating")
    private Integer totalRating;
    @Column(name = "VideoUrl", length = 1500)
    private String videoUrl;

    public Products() {
    }

    public Products(Integer id) {
        this.id = id;
    }

    public Products(Integer id, int productCategoryId, String name, double price, double discount) {
        this.id = id;
        this.productCategoryId = productCategoryId;
        this.name = name;
        this.price = price;
        this.discount = discount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public int getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(int productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getMainPage() {
        return mainPage;
    }

    public void setMainPage(Boolean mainPage) {
        this.mainPage = mainPage;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public Integer getOrdering() {
        return ordering;
    }

    public void setOrdering(Integer ordering) {
        this.ordering = ordering;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getImageState() {
        return imageState;
    }

    public void setImageState(Boolean imageState) {
        this.imageState = imageState;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Integer getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(Integer unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public Integer getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(Integer totalRating) {
        this.totalRating = totalRating;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.Products[ id=" + id + " ]";
    }
    
}
