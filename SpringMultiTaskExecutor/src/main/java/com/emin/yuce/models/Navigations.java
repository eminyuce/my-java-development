/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emin.yuce.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author EMIN
 */
@Entity
@Table(name = "Navigations", catalog = "TestEY_2", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Navigations.findAll", query = "SELECT n FROM Navigations n")})
public class Navigations implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Column(name = "StoreId")
    private Integer storeId;
    @Basic(optional = false)
    @Column(name = "ParentId", nullable = false)
    private int parentId;
    @Column(name = "Name", length = 255)
    private String name;
    @Column(name = "Modul", length = 255)
    private String modul;
    @Column(name = "ActionName", length = 255)
    private String actionName;
    @Column(name = "ControllerName", length = 255)
    private String controllerName;
    @Column(name = "Static")
    private Boolean static1;
    @Column(name = "Ordering")
    private Integer ordering;
    @Column(name = "Link", length = 500)
    private String link;
    @Column(name = "LinkState")
    private Boolean linkState;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "State")
    private Boolean state;
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;

    public Navigations() {
    }

    public Navigations(Integer id) {
        this.id = id;
    }

    public Navigations(Integer id, int parentId) {
        this.id = id;
        this.parentId = parentId;
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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModul() {
        return modul;
    }

    public void setModul(String modul) {
        this.modul = modul;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String getControllerName() {
        return controllerName;
    }

    public void setControllerName(String controllerName) {
        this.controllerName = controllerName;
    }

    public Boolean getStatic1() {
        return static1;
    }

    public void setStatic1(Boolean static1) {
        this.static1 = static1;
    }

    public Integer getOrdering() {
        return ordering;
    }

    public void setOrdering(Integer ordering) {
        this.ordering = ordering;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Boolean getLinkState() {
        return linkState;
    }

    public void setLinkState(Boolean linkState) {
        this.linkState = linkState;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
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
        if (!(object instanceof Navigations)) {
            return false;
        }
        Navigations other = (Navigations) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.Navigations[ id=" + id + " ]";
    }
    
}
