/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;

import JavaClasses.RegisterFilterClass;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterRegister implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String number = req.getParameter("number");
        String dob = req.getParameter("dob");
        String pass = req.getParameter("pass");
        String gender = req.getParameter("gender");
        String city = req.getParameter("city");

        RegisterFilterClass rf = new RegisterFilterClass();

        if (!rf.nameValidate(name)) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else if (!rf.emailValidate(email)) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else if (!rf.numberValidate(number)) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
       else if (!rf.dobValidate(dob)) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else if (!rf.passValidate(pass)) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else if (gender==null) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else if (city.equals("Select city")) {
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
        else{
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {

    }

}
