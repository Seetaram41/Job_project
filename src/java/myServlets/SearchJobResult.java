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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchJobResult extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String technology=req.getParameter("technology");
        String location = req.getParameter("location");
        Connection con = Database_Connect.getConnection();
        String sql = "select*from jobs where job_profile=? and job_location=?";
        String id ="",job_profile="", company="", experience="", discription="", date1="", time1="";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, technology);
            ps.setString(2, location);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                id=rs.getString("id");
                job_profile=rs.getString("job_profile");
                company=rs.getString("company");
                experience=rs.getString("experience");
                discription=rs.getString("discription");
                date1=rs.getString("date1");
                time1=rs.getString("time1");
                
            }
        } catch (Exception e) {
            out.print(e);
        }
        
    }
}
