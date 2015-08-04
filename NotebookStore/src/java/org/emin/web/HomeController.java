/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.emin.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.emin.service.NotebookManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Administrator
 */
public class HomeController  implements Controller{
    private NotebookManager notebookManager;

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        Map map = new HashMap();
        map.put("notebooks", notebookManager.getNotebooks());
        return new ModelAndView("home",map);
    }

    public void setNotebookManager(NotebookManager notebookManager) {
        this.notebookManager = notebookManager;
    }
}
