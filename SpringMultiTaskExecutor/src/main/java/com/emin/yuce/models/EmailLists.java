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
@Table(name = "EmailLists")
public class EmailLists implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "StoreId")
    private Integer storeId;
    @Column(name = "Name", length = 255)
    private String name;
    @Column(name = "Email", length = 500)
    private String email;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Column(name = "State")
    private Boolean state;
    @Column(name = "Ordering")
    private Integer ordering;

    public EmailLists() {
    }

    public EmailLists(Integer id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmailLists)) {
            return false;
        }
        EmailLists other = (EmailLists) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.EmailLists[ id=" + id + " ]";
    }
    
}
