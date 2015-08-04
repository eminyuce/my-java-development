/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.emin.service;

import java.util.Iterator;
import java.util.List;
import org.emin.domain.Notebook;

public class BasicNotebookManager implements NotebookManager {

    private List<Notebook> dataSource;

    public List<Notebook> getNotebooks() {
        return dataSource;
    }

    public void setDataSource(List<Notebook> notebookList) {
        this.dataSource = notebookList;
    }

    public Notebook getNotebookWithName(String name) {
        for (Iterator<Notebook> it = dataSource.iterator(); it.hasNext();) {
            Notebook notebook = it.next();
            if (notebook.getModel().equals(name)) {
                return notebook;
            }
        }

        return null;
    }
}
