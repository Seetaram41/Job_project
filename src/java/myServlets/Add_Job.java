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

public class Add_Job extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String job_profile = req.getParameter("job_profile");
        String company = req.getParameter("company");
        String experience = req.getParameter("experience");
        String salary = req.getParameter("salary");
        String no_of_opening = req.getParameter("no_of_opening");
        String job_location = req.getParameter("job_location");
        String time_venue = req.getParameter("time_venue");
        String discription = req.getParameter("discription");
        String c_email = req.getParameter("c_email");
        String c_person_name = req.getParameter("c_person_name");
        String c_person_profile = req.getParameter("c_person_profile");
        String c_phone_no = req.getParameter("c_phone_no");
        String date1 = req.getParameter("date1");
        String time1 = req.getParameter("time1");
        out.print(job_profile);
        
        
        try {
            Connection con = Database_Connect.getConnection();
            String sql = "insert into jobs(job_profile,company,experience,salary,no_of_opening,job_location,time_venue,discription,c_email,c_person_name,c_person_profile,c_phone_no,date1,time1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, job_profile );
            ps.setString(2, company);
            ps.setString(3, experience );
            ps.setString(4, salary);
            ps.setString(5, no_of_opening);
            ps.setString(6, job_location);
            ps.setString(7, time_venue);
            ps.setString(8, discription);
            ps.setString(9, c_email);
            ps.setString(10,c_person_name);
            ps.setString(11,c_person_profile);
            ps.setString(12,c_phone_no);
            ps.setString(13,date1);
            ps.setString(14,time1);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                resp.sendRedirect("index.jsp");
            }
            else{
                out.print("Something error");
            }
           
        } catch (Exception e) {
            out.print(e);
        }
        
    }
      
}
