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
@Table(name = "FileManagers")
public class FileManagers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "StoreId")
    private Integer storeId;
    @Column(name = "GoogleImageId", length = 500)
    private String googleImageId;
    @Column(name = "OriginalFilename", length = 500)
    private String originalFilename;
    @Column(name = "Title", length = 1500)
    private String title;
    @Column(name = "Name", length = 500)
    private String name;
    @Column(name = "ContentType", length = 255)
    private String contentType;
    @Column(name = "ContentLength")
    private Integer contentLength;
    @Basic(optional = false)
    @Column(name = "State", nullable = false)
    private boolean state;
    @Column(name = "Ordering")
    private Integer ordering;
    @Column(name = "ThumbnailLink", length = 500)
    private String thumbnailLink;
    @Column(name = "IconLink", length = 500)
    private String iconLink;
    @Column(name = "WebContentLink", length = 500)
    private String webContentLink;
    @Column(name = "ModifiedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "IsCarousel")
    private Boolean isCarousel;
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Column(name = "Width")
    private Integer width;
    @Column(name = "Height")
    private Integer height;
    @Column(name = "FileStatus", length = 50)
    private String fileStatus;
    @Column(name = "ImageSourceType", length = 50)
    private String imageSourceType;
    @Column(name = "FileSize", length = 50)
    private String fileSize;


    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public boolean isState() {
        return state;
    }


    public FileManagers() {
    }

    public FileManagers(Integer id) {
        this.id = id;
    }

    public FileManagers(Integer id, boolean state) {
        this.id = id;
        this.state = state;
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

    public String getGoogleImageId() {
        return googleImageId;
    }

    public void setGoogleImageId(String googleImageId) {
        this.googleImageId = googleImageId;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Integer getContentLength() {
        return contentLength;
    }

    public void setContentLength(Integer contentLength) {
        this.contentLength = contentLength;
    }

    public boolean getState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public Integer getOrdering() {
        return ordering;
    }

    public void setOrdering(Integer ordering) {
        this.ordering = ordering;
    }

    public String getThumbnailLink() {
        return thumbnailLink;
    }

    public void setThumbnailLink(String thumbnailLink) {
        this.thumbnailLink = thumbnailLink;
    }

    public String getIconLink() {
        return iconLink;
    }

    public void setIconLink(String iconLink) {
        this.iconLink = iconLink;
    }

    public String getWebContentLink() {
        return webContentLink;
    }

    public void setWebContentLink(String webContentLink) {
        this.webContentLink = webContentLink;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getIsCarousel() {
        return isCarousel;
    }

    public void setIsCarousel(Boolean isCarousel) {
        this.isCarousel = isCarousel;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getFileStatus() {
        return fileStatus;
    }

    public void setFileStatus(String fileStatus) {
        this.fileStatus = fileStatus;
    }

    public String getImageSourceType() {
        return imageSourceType;
    }

    public void setImageSourceType(String imageSourceType) {
        this.imageSourceType = imageSourceType;
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
        if (!(object instanceof FileManagers)) {
            return false;
        }
        FileManagers other = (FileManagers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.FileManagers[ id=" + id + " ]";
    }
    
}
