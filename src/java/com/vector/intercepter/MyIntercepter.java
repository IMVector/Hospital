/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Vector
 */
public class MyIntercepter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println(request.getServletPath());

        if (request.getServletPath().startsWith("/patient")) {
            if (null == request.getSession().getAttribute("patient")) {
                response.sendRedirect(request.getContextPath() + "/patient/goToLogin");
                return false;
            }

        } else if (request.getServletPath().startsWith("/staff")) {
            if (null == request.getSession().getAttribute("staff")) {
                response.sendRedirect(request.getContextPath() + "/staff/goToStaffLogin");
                return false;
            }
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest hsr, HttpServletResponse hsr1,
            Object o, ModelAndView mav) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest hsr, HttpServletResponse hsr1,
            Object o, Exception excptn) throws Exception {
    }

}
