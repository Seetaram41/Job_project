<%-- 
    Document   : myApplied_job
    Created on : 24 Jun, 2023, 1:09:22 PM
    Author     : Seeta Ram
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
    </head>
    <body>
        <jsp:include page="profile_header.jsp"></jsp:include>
        <jsp:include page="profile_menubar.jsp"></jsp:include>
        <jsp:scriptlet>
            String email = (String)session.getAttribute("session_email");
            String jobid="";
            Connection con = Database_Connect.getConnection();
            String sql = "select*from applied_job where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                jobid = rs.getString("jobid");
                
                String job_profile="", company="", experience="", discription="", date1="", time1="";
                
                String sql2="select*from jobs where id=?";
                PreparedStatement ps1 = con.prepareStatement(sql2);
                ps1.setString(1, jobid);
                ResultSet rs1=ps1.executeQuery();
                
                if(rs1.next()){
                job_profile=rs1.getString("job_profile");
                company=rs1.getString("company");
                experience=rs1.getString("experience");
                discription=rs1.getString("discription");
                date1=rs1.getString("date1");
                time1=rs1.getString("time1"); 
              </jsp:scriptlet>
                 <div class="row job_edit" >
                    <div class="col-md-2 light"></div>
                    <div class="col-md-8">
                        <b class="job_font2"><jsp:expression>job_profile</jsp:expression></b>
                        <span class="job_c job_font right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                        <span class="glyphicon glyphicon-home"></span> <span class="job_c job_font"> Company : </span> <jsp:expression>company</jsp:expression><br>
                        <span> <span class="glyphicon glyphicon-book"></span> <span class="job_c job_font"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                        <span> <span class="glyphicon glyphicon-file"></span>  <span class="job_c job_font"> Job Description : </span> <jsp:expression>discription</jsp:expression> </span> <br>
                        <br><a href="job_discription.jsp?jid=<jsp:expression>jobid</jsp:expression>"> See Full Details </a>
                    </div>
                    <div class="col-md-2 light"></div>
                </div>
                       
              <jsp:scriptlet>
                }
            }
             </jsp:scriptlet>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
