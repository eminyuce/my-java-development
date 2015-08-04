/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.emin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.emin.domain.Notebook;
import org.emin.service.NotebookManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author habanoz
 */
public class BuyNotebookController2 extends AbstractController {
    private NotebookManager notebookManager;

    public void setNotebookManager(NotebookManager notebookManager) {
        this.notebookManager = notebookManager;
    }
    
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        String model = hsr.getParameter("model");
        if(model!=null){
            Notebook notebook = notebookManager.getNotebookWithName(model);
            if(notebook!=null){
                return new ModelAndView("buynotebook","notebook",notebook);
            }
        }
        return new ModelAndView("nonotebook");
    }

}
