<%@page import="java.lang.String"%>

<%-- 
    Document   : profile_menubar
    Created on : 19 Feb, 2023, 10:05:41 AM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
</jsp:scriptlet> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
    </head>
    <body>
        <div class="row  gray ">
            <div class="col-md-9">
                <span class="span-logo" ><img src="images/logo-j.png"></span> 
                <span class="snap-tittle">Job portal</span>
            </div>
            <div  class="col-md-3">
                <div class="profile_menubar1">
                    <h3><a href="profile.jsp"> <jsp:expression> name</jsp:expression> </a></h3>
                </div>
                <div class="profile_menubar2">
                    <a href="LogOut">LogOut</a>
                </div>
            </div>
        </div>
    </body>
</html>
