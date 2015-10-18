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
@Table(name = "Contents")
public class Contents implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "StoreId")
    private Integer storeId;
    @Basic(optional = false)
    @Column(name = "CategoryId", nullable = false)
    private int categoryId;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 500)
    private String name;
    @Column(name = "Author", length = 255)
    private String author;
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
    @Column(name = "VideoUrl", length = 1500)
    private String videoUrl;
    @Column(name = "TotalRating")
    private Integer totalRating;

    public Contents() {
    }

    public Contents(Integer id) {
        this.id = id;
    }

    public Contents(Integer id, int categoryId, String name) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Integer getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(Integer totalRating) {
        this.totalRating = totalRating;
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
        if (!(object instanceof Contents)) {
            return false;
        }
        Contents other = (Contents) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.Contents[ id=" + id + " ]";
    }
    
}
