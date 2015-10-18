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
@Table(name = "Stores")
public class Stores implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "CategoryId")
    private Integer categoryId;
    @Column(name = "Name", length = 255)
    private String name;
    @Column(name = "Domain", length = 255)
    private String domain;
    @Column(name = "Layout", length = 255)
    private String layout;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "UpdatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Column(name = "Ordering")
    private Integer ordering;
    @Column(name = "State")
    private Boolean state;
    @Column(name = "GoogleDriveClientId", length = 500)
    private String googleDriveClientId;
    @Column(name = "GoogleDriveUserEmail", length = 500)
    private String googleDriveUserEmail;
    @Column(name = "GoogleDriveUserEmailPassword", length = 500)
    private String googleDriveUserEmailPassword;
    @Column(name = "GoogleDriveFolder", length = 500)
    private String googleDriveFolder;
    @Column(name = "GoogleDriveServiceAccountEmail", length = 500)
    private String googleDriveServiceAccountEmail;
    @Column(name = "GoogleDriveCertificateP12FileName", length = 500)
    private String googleDriveCertificateP12FileName;
    @Column(name = "GoogleDrivePassword", length = 500)
    private String googleDrivePassword;
    @Lob
    @Column(name = "GoogleDriveCertificateP12RawData")
    private byte[] googleDriveCertificateP12RawData;
    @Column(name = "IsCacheEnable")
    private Boolean isCacheEnable;

    public Stores() {
    }

    public Stores(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
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

    public Integer getOrdering() {
        return ordering;
    }

    public void setOrdering(Integer ordering) {
        this.ordering = ordering;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getGoogleDriveClientId() {
        return googleDriveClientId;
    }

    public void setGoogleDriveClientId(String googleDriveClientId) {
        this.googleDriveClientId = googleDriveClientId;
    }

    public String getGoogleDriveUserEmail() {
        return googleDriveUserEmail;
    }

    public void setGoogleDriveUserEmail(String googleDriveUserEmail) {
        this.googleDriveUserEmail = googleDriveUserEmail;
    }

    public String getGoogleDriveUserEmailPassword() {
        return googleDriveUserEmailPassword;
    }

    public void setGoogleDriveUserEmailPassword(String googleDriveUserEmailPassword) {
        this.googleDriveUserEmailPassword = googleDriveUserEmailPassword;
    }

    public String getGoogleDriveFolder() {
        return googleDriveFolder;
    }

    public void setGoogleDriveFolder(String googleDriveFolder) {
        this.googleDriveFolder = googleDriveFolder;
    }

    public String getGoogleDriveServiceAccountEmail() {
        return googleDriveServiceAccountEmail;
    }

    public void setGoogleDriveServiceAccountEmail(String googleDriveServiceAccountEmail) {
        this.googleDriveServiceAccountEmail = googleDriveServiceAccountEmail;
    }

    public String getGoogleDriveCertificateP12FileName() {
        return googleDriveCertificateP12FileName;
    }

    public void setGoogleDriveCertificateP12FileName(String googleDriveCertificateP12FileName) {
        this.googleDriveCertificateP12FileName = googleDriveCertificateP12FileName;
    }

    public String getGoogleDrivePassword() {
        return googleDrivePassword;
    }

    public void setGoogleDrivePassword(String googleDrivePassword) {
        this.googleDrivePassword = googleDrivePassword;
    }

    public byte[] getGoogleDriveCertificateP12RawData() {
        return googleDriveCertificateP12RawData;
    }

    public void setGoogleDriveCertificateP12RawData(byte[] googleDriveCertificateP12RawData) {
        this.googleDriveCertificateP12RawData = googleDriveCertificateP12RawData;
    }

    public Boolean getIsCacheEnable() {
        return isCacheEnable;
    }

    public void setIsCacheEnable(Boolean isCacheEnable) {
        this.isCacheEnable = isCacheEnable;
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
        if (!(object instanceof Stores)) {
            return false;
        }
        Stores other = (Stores) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.Stores[ id=" + id + " ]";
    }
    
}
