package myServlets;

import JavaClasses.Database_Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Add_Personal_Details extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");
        String name = req.getParameter("name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String city = req.getParameter("city");
        String skills = req.getParameter("skills");
        String title = req.getParameter("title");
        Connection con;
        int rowCount2=0;
        int rowCount=0;
        try {
            con = Database_Connect.getConnection();
            String sqlQuery = "update register set name =?, dob=? , gender = ? , city = ? where email = ?";
            PreparedStatement ps = con.prepareStatement(sqlQuery);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, city);
            ps.setString(5, email);
           rowCount = ps.executeUpdate();

//            update about_user set about=?, skills=? where email=?
            String sqlQuery2 = "update personal_details set skills =?,  title = ? where email =  ?";
            PreparedStatement ps2 = con.prepareStatement(sqlQuery2);
            ps2.setString(1, skills);
            ps2.setString(2, title);
            ps2.setString(3, email);
             rowCount2 = ps2.executeUpdate();

            if (rowCount > 0 && rowCount2 > 0) {
                session.setAttribute("session_name", name);
                session.setAttribute("session_dob", dob);
                session.setAttribute("session_gender", gender);
                session.setAttribute("session_city", city);
                
                session.setAttribute("session_skills", skills);
                session.setAttribute("session_title", title);
                resp.sendRedirect("profile.jsp");
            } else {

            }
        } catch (SQLException ex) {
          out.print(ex);
        }
    }

}
