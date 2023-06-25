/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;

import JavaClasses.Database_Connect;
import JavaClasses.Path_Details;
import com.mysql.cj.conf.PropertyKey;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Seeta Ram
 */
public class Upload_Resume extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String email = (String)session.getAttribute("session_email");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);
         String file_name = "";
        try{
            List<FileItem>items = sfu.parseRequest(req);
            FileItem item = items.get(0);
            String File_path = item.getName();
            File file = new File(File_path);
            file_name =file.getName();
            
            File f1 = new File(Path_Details.RESUME_PATH+file_name);
            item.write(f1);
        }
        catch( Exception e){
            out.print(e);
        }
        
        
        try {
            Connection con = Database_Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("update resume set path = ? where email = ?");
            ps.setString(1, file_name);
            ps.setString(2, email);
            int rowCount = ps.executeUpdate();
            if (rowCount > 0) {
                session.setAttribute("session_resume_path", file_name);
                resp.sendRedirect("profile.jsp");
            }
        } catch (SQLException e) {
            out.print("hello");

        }
    }
}
