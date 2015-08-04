/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.emin.domain;

public class Notebook {

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private String mark;
    private String model;
    private int quantity;

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
        if (this.quantity < 0) {
            this.quantity = 0;
        }
    }
}
