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

public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String number = req.getParameter("number");
        String dob = req.getParameter("dob");
        String pass = req.getParameter("pass");
        String gender = req.getParameter("gender");
        String city = req.getParameter("city");

        System.out.println(name);
        Connection con = Database_Connect.getConnection();
        int rowCount1 = 0;
        int rowCount2 = 0;
        int rowCount3 = 0;
        int rowCount4 = 0;
        int rowCount5 = 0;
        int rowCount6 = 0;
        int rowCount7 = 0;

        if (!("".equals(name) || "".equals(email) || "".equals(number) || "".equals(dob) || "".equals(number) || "".equals(pass))) {
            try {
                String sql_query = "select*from register where email=?";
                PreparedStatement ps = con.prepareStatement(sql_query);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    resp.sendRedirect("registerError.jsp");
                } else {
                    try {
                        String sql_query1 = "insert into register values (?,?,?,?,?,?,?)";
                        String sql_query2 = "insert into personal_details(email,skills,title) values(?,?,?)";
                        String sql_query3 = "insert into education_details(email,school,field,grade,year,achievement) values(?,?,?,?,?,?)";
                        String sql_query4 = "insert into experience_details(email,company,department,year,location,achievement) values(?,?,?,?,?,?)";
                        String sql_query5 = "insert into profile_pic(email,profile_pic_path) values(?,?)";
                        String sql_query6 = "insert into resume(email,path) values(?,?)";
                        String sql_query7 = "insert into resume_builder(address,career,hobbies,marital,language,email) values(?,?,?,?,?,?)";
            
           

                        PreparedStatement ps1 = con.prepareStatement(sql_query1);
                        PreparedStatement ps2 = con.prepareStatement(sql_query2);
                        PreparedStatement ps3 = con.prepareStatement(sql_query3);
                        PreparedStatement ps4 = con.prepareStatement(sql_query4);
                        PreparedStatement ps5 = con.prepareStatement(sql_query5);
                        PreparedStatement ps6 = con.prepareStatement(sql_query6);
                        PreparedStatement ps7 =con.prepareStatement( sql_query7);

                        ps1.setString(1, name);
                        ps1.setString(2, email);
                        ps1.setString(3, number);
                        ps1.setString(4, dob);
                        ps1.setString(5, pass);
                        ps1.setString(6, gender);
                        ps1.setString(7, city);

                        ps2.setString(1, email);
                        ps2.setString(2, "");
                        ps2.setString(3, "");

                        ps3.setString(1, email);
                        ps3.setString(2, "");
                        ps3.setString(3, "");
                        ps3.setString(4, "");
                        ps3.setString(5, "");
                        ps3.setString(6, "");

                        ps4.setString(1, email);
                        ps4.setString(2, "");
                        ps4.setString(3, "");
                        ps4.setString(4, "");
                        ps4.setString(5, "");
                        ps4.setString(6, "");

                        ps5.setString(1, email);
                        ps5.setString(2, "icon.jpg");

                        ps6.setString(1, email);
                        ps6.setString(2, "");
                        
                        ps7.setString(1, "");
                        ps7.setString(2, "");
                        ps7.setString(3, "");
                        ps7.setString(4, "");
                        ps7.setString(5, "");
                        ps7.setString(6, email);
  
                        rowCount1 = ps1.executeUpdate();
                        rowCount2 = ps2.executeUpdate();
                        rowCount3 = ps3.executeUpdate();
                        rowCount4 = ps4.executeUpdate();
                        rowCount5 = ps5.executeUpdate();
                        rowCount6 = ps6.executeUpdate();
                        rowCount7 = ps7.executeUpdate();

                        if (rowCount1 > 0 && rowCount2 > 0 && rowCount3 > 0 && rowCount4 > 0 && rowCount5 > 0 && rowCount6 > 0 && rowCount7 > 0) {
                            HttpSession session = req.getSession();

                            session.setAttribute("session_name", name);
                            session.setAttribute("session_email", email);
                            session.setAttribute("session_number", number);
                            session.setAttribute("session_dob", dob);
                            session.setAttribute("session_gender", gender);
                            session.setAttribute("session_city", city);

                            session.setAttribute("session_skills", "");
                            session.setAttribute("session_title", "");

                            session.setAttribute("session_school", "");
                            session.setAttribute("session_achievement", "");
                            session.setAttribute("session_year", "");

                            session.setAttribute("session_company", "");
                            session.setAttribute("session_department", "");
                            session.setAttribute("session_location", "");
                            session.setAttribute("session_experience_year", "");
                            session.setAttribute("session_achievement", "");

                            session.setAttribute("session_profile_pic_path", "icon.jpg");
                            
                            session.setAttribute("session_resume_path", "");
                            
                            session.setAttribute("session_address", "");
                            session.setAttribute("session_career", "");
                            session.setAttribute("session_hobbies", "");
                            session.setAttribute("session_marital", "");
                            session.setAttribute("session_language", "");

                            resp.sendRedirect("profile.jsp");

                        } else {
                            out.print(rowCount3);
                            out.print(rowCount2);
                            out.print(rowCount1);
                        }
                    } catch (SQLException | IOException e) {
                        out.print(rowCount3);
                        out.print(rowCount2);
                        out.print(rowCount1);
                        out.print(e);
                    }
                }
            } catch (SQLException | IOException e) {

                out.print(e);
            }
        } else {
            resp.sendRedirect("registerError.jsp");
        }
    }

}
