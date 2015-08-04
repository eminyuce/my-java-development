/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.emin.service;

import java.util.Iterator;
import java.util.List;
import org.emin.domain.Notebook;

/**
 *
 * @author Administrator
 */
public class BasicNotebookManager implements NotebookManager {

    private List<Notebook> dataSource;

    @Override
    public List<Notebook> getNotebooks() {
        return dataSource;
    }

    @Override
    public void setDataSource(Object source) {
        dataSource = (List<Notebook>) source;
    }

    @Override
    public void decreaseQuantity(int id, int decrese) {
        for (Iterator<Notebook> it = dataSource.iterator(); it.hasNext();) {
            Notebook notebook = it.next();
            
            if (notebook.getId() == id) {
                notebook.setQuantity(notebook.getQuantity() - decrese);
            }
        }
        
    }
}
