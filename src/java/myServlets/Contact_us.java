/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;

import JavaClasses.Database_Connect;
import JavaClasses.JavaMail;
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

/**
 *
 * @author Seeta Ram
 */
public class Contact_us extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");
        
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyy");
        String date1 = sdf.format(d);
        
        Date d2 = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("hh-mm-ss");
        String time1 = sdf2.format(d2);
        
        String sql = "insert into contact_us(name,email,subject,message,date1,time1) values (?,?,?,?,?,?)";
        Connection con = Database_Connect.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.setString(5, date1);
            ps.setString(6, time1);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                
                String subject1 = "Thank You";
                String message1 = "Thank you for contacting us, our team will contact you as possible......!!";
                JavaMail.SendMail(email, subject1, message1);
                req.setAttribute("success_message", "your message sended successfully");
                RequestDispatcher rd1 =req.getRequestDispatcher("success_Messege.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2 =req.getRequestDispatcher("contact_us.jsp");
                rd2.include(req, resp);              
            }
            else{
//                RequestDispatcher rd1 =req.getRequestDispatcher("error_Messege.jsp");
//                rd1.include(req, resp);
                RequestDispatcher rd2 =req.getRequestDispatcher("contact_us.jsp");
                rd2.include(req, resp);
            }
        } catch (Exception e) {
            out.print(e);
        }
        
    }
    
}
