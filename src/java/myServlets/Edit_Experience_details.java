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
public class Edit_Experience_details extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
      
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("session_id");
        String company = req.getParameter("company");
        String department = req.getParameter("department");
        String year = req.getParameter("year");
        String location = req.getParameter("location");
        String achievement = req.getParameter("achievement");
        
        String sql_query ="update experience_details set company = ?, department = ?, year = ?, location =?,achievement = ? where id = ?";
        try {
            Connection con = Database_Connect.getConnection();
            PreparedStatement ps = con.prepareStatement(sql_query);
            ps.setString(1, company);
            ps.setString(2, department);
            ps.setString(3, year);
            ps.setString(4, location);
            ps.setString(5, achievement);
            ps.setString(6, id);
            
            int rowCount = ps.executeUpdate();
            
            if (rowCount>0) {
                resp.sendRedirect("profile.jsp");
            }
            else{
                out.print(id);
            }
        } catch (SQLException | IOException e) {
            out.print(e);
        }
    }

}
