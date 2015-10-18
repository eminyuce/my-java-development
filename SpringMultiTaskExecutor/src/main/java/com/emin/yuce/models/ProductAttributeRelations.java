/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emin.yuce.models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author EMIN
 */
@Entity
@Table(name = "ProductAttributeRelations", catalog = "TestEY_2", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "ProductAttributeRelations.findAll", query = "SELECT p FROM ProductAttributeRelations p")})
public class ProductAttributeRelations implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Column(name = "ProductAttributeId")
    private Integer productAttributeId;
    @Column(name = "ProductId")
    private Integer productId;
    @Column(name = "ProductAttributeValue")
    private Integer productAttributeValue;

    public ProductAttributeRelations() {
    }

    public ProductAttributeRelations(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductAttributeId() {
        return productAttributeId;
    }

    public void setProductAttributeId(Integer productAttributeId) {
        this.productAttributeId = productAttributeId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductAttributeValue() {
        return productAttributeValue;
    }

    public void setProductAttributeValue(Integer productAttributeValue) {
        this.productAttributeValue = productAttributeValue;
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
        if (!(object instanceof ProductAttributeRelations)) {
            return false;
        }
        ProductAttributeRelations other = (ProductAttributeRelations) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.ProductAttributeRelations[ id=" + id + " ]";
    }
    
}
