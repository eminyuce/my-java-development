/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.emin.service;

import java.util.List;
import org.emin.domain.Notebook;

/**
 *
 * @author Administrator
 */
public interface NotebookManager {
    public List<Notebook> getNotebooks();
    public void setDataSource(Object source);
    public void decreaseQuantity(int id,int decrese);
 }
