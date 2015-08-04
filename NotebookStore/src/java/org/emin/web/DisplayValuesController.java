/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.emin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author habanoz
 */
public class DisplayValuesController implements Controller {

    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        return new ModelAndView("displayvalues");
    }

}
