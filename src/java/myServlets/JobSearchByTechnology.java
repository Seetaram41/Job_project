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

/**
 *
 * @author Seeta Ram
 */
public class JobSearchByTechnology extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String tech = req.getParameter("technology");
        String id, job_profile,company, experience, discription, date1, time1;
        try {
            Connection con = Database_Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from jobs where job_location LIKE '%"+tech+"%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                id=rs.getString("id");
                job_profile=rs.getString("job_profile");
                company=rs.getString("company");
                experience=rs.getString("experience");
                discription=rs.getString("discription");
                date1=rs.getString("date1");
                time1=rs.getString("time1");
                
//                out.print(id);
//                out.print(company);
//                out.print(experience);
//                out.print(discription);
//                out.print(date1);
//                out.print(time1);
                
                 out.print("<div class=\"col-md-12 display_job_div\">\n" +
"                                <b>"+job_profile+"</b> <span style=\"font-size: 12px; color: #9f9d9d; float: right\"> ("+date1+" & "+time1+")</span> <br>\n" +
"                            <span class=\"glyphicon glyphicon-home\"></span> <span style=\"color: #9f9d9d\"> Company : </span> "+company+"</span> <br>\n" +
"                                <span> <span class=\"glyphicon glyphicon-book\"></span> <span style=\"color: #9f9d9d\"> Experience : </span> "+experience+"</span> <br>\n" +
"                                <span> <span class=\"glyphicon glyphicon-file\"></span>  <span style=\"color: #9f9d9d\"> Job Description : </span> "+discription+"</span> <br>\n" +
"                                <br><a href=\"job_discription.jsp?jid="+id+"\"> See Full Details </a>\n" +
"                            </div>");
            }
        } catch (Exception e) {
            out.print(e);
        }
       
    }
   
}
//<div class="row job_edit" >
//                    <div class="col-md-2 light"></div>
//                    <div class="col-md-8 job_border">
//                        <b class="job_font2"><jsp:expression>job_profile</jsp:expression></b>
//                        <span class="job_c job_font right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
//                        <span class="glyphicon glyphicon-home"></span> <span class="job_c job_font"> Company : </span> <jsp:expression>company</jsp:expression><br>
//                        <span> <span class="glyphicon glyphicon-book"></span> <span class="job_c job_font"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
//                        <span> <span class="glyphicon glyphicon-file"></span>  <span class="job_c job_font"> Job Description : </span> <jsp:expression>discription</jsp:expression> </span> <br>
//                        <br><a href="job_discription.jsp?jid=<jsp:expression>id</jsp:expression>"> See Full Details </a>
//                    </div>
//                    <div class="col-md-2 light"></div>
//                </div>
