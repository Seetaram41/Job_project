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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Seeta Ram
 */
public class Add_Experience_Details extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");
        String company = req.getParameter("company");
        String department = req.getParameter("department");
        String year = req.getParameter("year");
        String location = req.getParameter("location");
        String achievement = req.getParameter("achievement");

        Connection con = Database_Connect.getConnection();
        String sql_query = "insert into experience_details(email,company,department,year,location,achievement) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql_query);
            ps.setString(1, email);
            ps.setString(2, company);
            ps.setString(3, department);
            ps.setString(4, year);
            ps.setString(5, location);
            ps.setString(6, achievement);

            int rc = ps.executeUpdate();
            if (rc > 0) {
                resp.sendRedirect("profile.jsp");
            }
        } catch (Exception e) {
            out.print(email + "<br>");
            out.print(company + "<br>");
            out.print(department + "<br>");
            out.print(year + "<br>");
            out.print(location + "<br>");
            out.print(achievement + "<br>");
            out.print(e);
        }
    }

}
