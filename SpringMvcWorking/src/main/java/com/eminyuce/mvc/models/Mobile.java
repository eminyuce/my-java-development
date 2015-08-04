package com.eminyuce.mvc.models;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Mert Meral
 */
@Entity
public class Mobile implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "MOBILE_NO")
    private Integer mobileNo;
    @ManyToOne
    @JoinColumn(name = "ADDRESS_ID", referencedColumnName = "ID", nullable = false, updatable = true, insertable = true)
    private Address address;

    public Mobile(Integer mobileNo, Address address) {
        this.mobileNo = mobileNo;
        this.address = address;
    }

    public Mobile() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(Integer mobileNo) {
        this.mobileNo = mobileNo;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Id="+getId()+" Mobile No="+getMobileNo()+" Address="+getAddress();
    }
}
