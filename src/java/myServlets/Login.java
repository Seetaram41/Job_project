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

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");

        Connection con = Database_Connect.getConnection();

        try {
            String sql_query = "select*from register where email= ? and password = ?";
            PreparedStatement ps = con.prepareStatement(sql_query);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            String sql_query2 = "select*from personal_details where email= ? ";
            PreparedStatement ps2 = con.prepareStatement(sql_query2);
            ps2.setString(1, email);
            ResultSet rs2 = ps2.executeQuery();

            String sql_query3 = "select*from education_details where email= ? ";
            PreparedStatement ps3 = con.prepareStatement(sql_query3);
            ps3.setString(1, email);
            ResultSet rs3 = ps3.executeQuery();

            String sql_query4 = "select*from experience_details where email= ? ";
            PreparedStatement ps4 = con.prepareStatement(sql_query4);
            ps4.setString(1, email);
            ResultSet rs4 = ps4.executeQuery();

            String sql_query5 = "select*from profile_pic where email= ? ";
            PreparedStatement ps5 = con.prepareStatement(sql_query5);
            ps5.setString(1, email);
            ResultSet rs5 = ps5.executeQuery();
            
            String sql_query6 = "select*from resume where email=?";
            PreparedStatement ps6 = con.prepareStatement(sql_query6);
            ps6.setString(1, email);
            ResultSet rs6 = ps6.executeQuery();
            
            
            if(rs6.next()){
                String path =rs6.getString("path");
                session.setAttribute("session_resume_path", path);
            }
            
            if(rs5.next()){
                String profile_pic_path = rs5.getString("profile_pic_path");
                
                session.setAttribute("session_profile_pic_path",profile_pic_path);
            }

            if (rs4.next()) {
                String company = rs4.getString("company");
                String department = rs4.getString("department");
                String year = rs4.getString("year");
                String location = rs4.getString("location");
                String achievement = rs4.getString("achievement");

                session.setAttribute("session_company", company);
                session.setAttribute("session_department", department);
                session.setAttribute("session_exp_year", year);
                session.setAttribute("session_location", location);
                session.setAttribute("session_exp_achievement", achievement);
            }

            if (rs3.next()) {
                String school = rs3.getString("school");
                String field = rs3.getString("field");
                String grade = rs3.getString("grade");
                String year = rs3.getString("year");
                String achievement = rs3.getString("achievement");

                session.setAttribute("session_school", school);
                session.setAttribute("session_feild", field);
                session.setAttribute("session_grade", grade);
                session.setAttribute("session_year", year);
                session.setAttribute("session_achievement", achievement);
            }

            if (rs2.next()) {
                String skills = rs2.getString("skills");
                String title = rs2.getString("title");
                session.setAttribute("session_skills", skills);
                session.setAttribute("session_title", title);
            }

            if (rs.next()) {

                String name = rs.getString("name");
                String email1 = rs.getString("email");
                String number = rs.getString("number");
                String dob = rs.getString("dob");
                String gender = rs.getString("gender");
                String city = rs.getString("city");

                session.setAttribute("session_name", name);
                session.setAttribute("session_email", email1);
                session.setAttribute("session_number", number);
                session.setAttribute("session_dob", dob);
                session.setAttribute("session_gender", gender);
                session.setAttribute("session_city", city);

                resp.sendRedirect("profile.jsp");
            } else {
                resp.sendRedirect("loginerror.jsp");
            }
        } catch (SQLException | IOException e) {

            out.print(e);
        }

    }

}
