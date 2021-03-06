package com.eminyuce.mvc.models;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Mert Meral
 */
@Entity
public class Student implements Serializable{
    private static final long serialVersionUID = 6331118601957378360L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;
    @NotFound(action = NotFoundAction.IGNORE)
    @Column(name = "NUMBER")
    private Integer number;
    @Column(name = "ADDRESS")
    private String address;
    @ManyToOne
    @JoinColumn(name = "MOBILE_ID", referencedColumnName = "ID", nullable = true, updatable = false, insertable = false)
    private Mobile mobile;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Mobile getMobile() {
        return mobile;
    }

    public void setMobile(Mobile mobile) {
        this.mobile = mobile;
    }

    @Override
    public String toString() {
        return "Id= "+getId()+" Number= "+getNumber()+" Address= "+getAddress();
    }
}
