<%-- 
    Document   : companies
    Created on : 24 Jun, 2023, 5:05:11 PM
    Author     : Seeta Ram
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String)session.getAttribute("session_email");
    String name = (String)session.getAttribute("session_name");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
    </head>
    <body>
         <div class="container-fluid">
            
            <jsp:scriptlet>
                if (email == null ? email == null : email.trim().equals("null")) {
            </jsp:scriptlet>
            
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>
            
            <jsp:scriptlet>
            
            } else {
                    
            </jsp:scriptlet>
            
             <jsp:include page="profile_header.jsp"></jsp:include>
              <jsp:include page="profile_menubar.jsp"></jsp:include>
              
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
              

                <div class="row">
                    <div class="col-md-3 padding">
                        <ul>
                            <li> <a href=""> Smart Programming </a> </li>
                            <li> <a href=""> Infosys </a> </li>
                            <li> <a href=""> Wipro </a> </li>
                            <li> <a href=""> IBM </a> </li>
                            <li> <a href=""> Google </a> </li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h2 class="center"> Our Partners </h2>
                        <div class="row">
                        <jsp:scriptlet>
                            String company = "", c_email="", c_phone_no="";
                            String sql ="select*from jobs";
                            Connection con = Database_Connect.getConnection();
                            PreparedStatement ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()){
                                company = rs.getString("company");
                                c_email = rs.getString("c_email");
                                c_phone_no = rs.getString("c_phone_no");
                                
                        </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-10">
                                        <b> <jsp:expression>company</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d;"> (<jsp:expression>c_email</jsp:expression>)</span> <br> <br>
                                    <span class="glyphicon glyphicon-phone-alt"></span> &nbsp; <span style="color: #9f9d9d"> Phone No : </span> <jsp:expression>c_phone_no</jsp:expression> </span> <br>
                                    <br><a href="company-jobs.jsp?c_email=<jsp:expression>c_email</jsp:expression>"> See All Jobs of this company </a>
                                    </div>
                                </div>
                            </div>
                            
                        <jsp:scriptlet>
                            }  
                        </jsp:scriptlet>
                            
                        </div>
                    </div>
                    <div class="col-md-3 padding">
                        <ul>
                            <li> <a href=""> Smart Programming </a> </li>
                            <li> <a href=""> Infosys </a> </li>
                            <li> <a href=""> Wipro </a> </li>
                            <li> <a href=""> IBM </a> </li>
                            <li> <a href=""> Google </a> </li>
                        </ul>
                    </div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
