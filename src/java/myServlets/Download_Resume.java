/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myServlets;

import JavaClasses.Path_Details;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument;

public class Download_Resume extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
       PrintWriter out = resp.getWriter();
       String file_name = req.getParameter("fn");
       resp.setHeader("Content-Disposition", "attachment; filename=\""+file_name);
       FileInputStream fis = new FileInputStream(Path_Details.RESUME_PATH+file_name);
       int i ;
       while((i=fis.read()) != -1){
           out.write(i);
       }
       fis.close();
       out.close();
       
    }
   
}
