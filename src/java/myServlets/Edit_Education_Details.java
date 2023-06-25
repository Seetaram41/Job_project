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
public class Edit_Education_Details extends HttpServlet {

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
        String id = (String)session.getAttribute("session_id");

        try {
            Connection con = Database_Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("update education_details set school=?, field = ?, grade =? ,year=? ,achievement=?  where email=? and id =?");
            
            ps.setString(1, school);
            ps.setString(2, field);
            ps.setString(3, grade);
            ps.setString(4, year);
            ps.setString(5, achievement);
            ps.setString(6, email);
            ps.setString(7, id);
            
            
            int rowCount = ps.executeUpdate();
            if (rowCount > 0) {
                resp.sendRedirect("profile.jsp");
            } else {
                out.print(rowCount);
                out.print(id);
            }
        } catch (SQLException | IOException e) {
            out.print(e);
        }

    }

}
