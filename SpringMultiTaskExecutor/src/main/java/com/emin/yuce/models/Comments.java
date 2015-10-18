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
@Table(name = "Comments", catalog = "TestEY_2", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Comments.findAll", query = "SELECT c FROM Comments c")})
public class Comments implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "ParentId", nullable = false)
    private int parentId;
    @Basic(optional = false)
    @Column(name = "StoreId", nullable = false)
    private int storeId;
    @Column(name = "ItemId")
    private Integer itemId;
    @Column(name = "ItemType", length = 25)
    private String itemType;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 255)
    private String name;
    @Basic(optional = false)
    @Column(name = "Email", nullable = false, length = 255)
    private String email;
    @Basic(optional = false)
    @Column(name = "CommentType", nullable = false, length = 255)
    private String commentType;
    @Column(name = "Comment", length = 2147483647)
    private String comment;
    @Basic(optional = false)
    @Column(name = "State", nullable = false)
    private boolean state;
    @Basic(optional = false)
    @Column(name = "Ordering", nullable = false)
    private int ordering;
    @Basic(optional = false)
    @Column(name = "CreatedDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Basic(optional = false)
    @Column(name = "UpdatedDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;

    public Comments() {
    }

    public Comments(Integer id) {
        this.id = id;
    }

    public Comments(Integer id, int parentId, int storeId, String name, String email, String commentType, boolean state, int ordering, Date createdDate, Date updatedDate) {
        this.id = id;
        this.parentId = parentId;
        this.storeId = storeId;
        this.name = name;
        this.email = email;
        this.commentType = commentType;
        this.state = state;
        this.ordering = ordering;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
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

    public String getCommentType() {
        return commentType;
    }

    public void setCommentType(String commentType) {
        this.commentType = commentType;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean getState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public int getOrdering() {
        return ordering;
    }

    public void setOrdering(int ordering) {
        this.ordering = ordering;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comments)) {
            return false;
        }
        Comments other = (Comments) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.Comments[ id=" + id + " ]";
    }
    
}
