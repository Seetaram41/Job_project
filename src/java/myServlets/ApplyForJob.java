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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApplyForJob extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String email = (String)session.getAttribute("session_email");
        String jid = req.getParameter("jid");
        
        Date d = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-mm-yyyy");
        String date1 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("hh-mm-ss");
        String time1 = sdf2.format(d);
        String sql = "insert into applied_job(jobid,email,date1,time1) values(?,?,?,?)";
        Connection con = Database_Connect.getConnection();
        try{
             PreparedStatement ps = con.prepareStatement(sql);
             ps.setString(1, jid);
             ps.setString(2, email);
             ps.setString(3, date1);
             ps.setString(4, time1);
             int rowCount= ps.executeUpdate();
             if(rowCount>0){
                 RequestDispatcher rd1 = req.getRequestDispatcher("job_success_applied.jsp");
                 rd1.include(req, resp);
                 
                 RequestDispatcher rd2 = req.getRequestDispatcher("job_discription.jsp?jid="+jid);
                 rd2.include(req, resp);
             }
             else{
                resp.sendRedirect("job_discription.jsp");
             }
             
        }
        catch(Exception e){
            out.print(e);
        }
       
        
    } 
}
