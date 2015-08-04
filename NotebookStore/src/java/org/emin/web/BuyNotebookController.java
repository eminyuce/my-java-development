/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.emin.web;

import java.net.BindException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.emin.domain.Notebook;
import org.emin.service.NotebookManager;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

/** 
 *
 * @author habanoz
 */
public class BuyNotebookController extends SimpleFormController {

    private NotebookManager notebookManager;

    public BuyNotebookController() {
        //Initialize controller properties here or 
        //in the Web Application Context
        setCommandClass(org.emin.domain.Notebook.class);
        setCommandName("notebook");
        setSuccessView("displayvalues");
        setFormView("buynotebook");
    }

    /*
    @Override
    protected void doSubmitAction(Object command) throws Exception {
    throw new UnsupportedOperationException("Not yet implemented");
    }*/
    @Override
    protected Object formBackingObject(HttpServletRequest hsr) throws Exception {
        String model = hsr.getParameter("model");
        if (model != null) {
            Notebook notebook = notebookManager.getNotebookWithName(model);
            if (notebook != null) {
                return notebook;
            }
        }
        return null;
    }

    public void setNotebookManager(NotebookManager notebookManager) {
        this.notebookManager = notebookManager;
    }
    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects

    protected ModelAndView onSubmit(
            HttpServletRequest request,
            HttpServletResponse response,
            Object command,
            BindException errors) throws Exception {

        Notebook notebook = (Notebook) command;
        notebook.setQuantity(Integer.parseInt(request.getParameter("quantity")));

        return new ModelAndView(new RedirectView(getSuccessView()));
    }
}
