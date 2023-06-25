/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;

import JavaClasses.Database_Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Seeta Ram
 */
public class Add_Education_Details extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");
        String school = req.getParameter("school");
        String field = req.getParameter("field");
        String grade = req.getParameter("grade");
        String year = req.getParameter("year");
        String achievement = req.getParameter("achievement");

        Connection con = Database_Connect.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("insert into education_details(email,school,field,grade,year,achievement) values(?,?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, school);
            ps.setString(3, field);
            ps.setString(4, grade);
            ps.setString(5, year);
            ps.setString(6, achievement);

            int rs = ps.executeUpdate();
            if (rs > 0) {
                resp.sendRedirect("profile.jsp");
            } else {
                resp.sendRedirect("Add_education_details.jsp");
            }
        } catch (SQLException | IOException e) {
            out.print(email+"<br>");
            out.print(school+"<br>");
            out.print(field+"<br>");
            out.print(grade+"<br>");
            out.print(year+"<br>");
            out.print(achievement+"<br>");

            out.print(e);
        }
    }
}
