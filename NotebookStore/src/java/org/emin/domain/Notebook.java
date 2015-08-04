/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.emin.domain;

/**
 *
 * @author Administrator
 */
public class Notebook {

    private int id;
    private String mark;
    private String model;
    private int quantity;
    private String string;

    {
        this.string = toString();
    }

    public Notebook() {
    }

    public Notebook(int id, String mark, String model, int quantity) {
        this.id = id;
        this.mark = mark;
        this.model = model;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getString(){
        return this.string;
    }
}
