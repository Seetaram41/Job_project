<%-- 
    Document   : profile_homepage
    Created on : 19 Feb, 2023, 10:54:50 AM
    Author     : Seeta Ram
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
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
        <div class="container-fluid">
            <jsp:include page="profile_header.jsp"></jsp:include>
            <jsp:include page="profile_menubar.jsp"></jsp:include>          
                <div class="row" style="border: 2px solid black">
                    <img src="images/jobs_header.jpg" >
                </div>
                <div class="row" style="background-color: #e7e4f5">
                    <div class="col-md-2 "></div>
                    <div class="col-md-8 job_search_div">
                        <h1>Find job at india's no.1 job site</h1>
                        <form method="post" action="Search_job_result.jsp">
                            <input type="text" name="technology" placeholder="technology..." class="find_job_input ">
                            <input type="text" name="location" placeholder="location..." class="find_job_input">
                            <input type="submit" value="search">
                        </form>
                    </div> 
                    <div class="col-md-2"></div>
                </div>
            <jsp:scriptlet>
                
                String job_location1="", id ="",job_profile="", company="", experience="", discription="", date1="", time1="";
                Connection con = Database_Connect.getConnection();
                String sql = "select*from jobs";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                     id=rs.getString("id");
                     job_profile=rs.getString("job_profile");
                     company=rs.getString("company");
                     experience=rs.getString("experience");
                     discription=rs.getString("discription");
                     date1=rs.getString("date1");
                     time1=rs.getString("time1"); 
                     job_location1 =rs.getString("job_location");
                </jsp:scriptlet>  
                
                <div class="row job_edit" >
                    <div class="col-md-2 light"></div>
                    <div class="col-md-8">
                        <b class="job_font2"><jsp:expression>job_profile</jsp:expression></b>
                        <span class="job_c job_font right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                        <span class="glyphicon glyphicon-home"></span> <span class="job_c job_font"> Company : </span> <jsp:expression>company</jsp:expression><br>
                        <span> <span class="glyphicon glyphicon-book"></span> <span class="job_c job_font"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                         <span> <span class="glyphicon glyphicon-file"></span>  <span class="job_c job_font"> Job Description : </span> <jsp:expression>job_location1</jsp:expression> </span> <br>
                        <span> <span class="glyphicon glyphicon-file"></span>  <span class="job_c job_font"> Job Description : </span> <jsp:expression>discription</jsp:expression> </span> <br>
                        <br><a href="job_discription.jsp?jid=<jsp:expression>id</jsp:expression>"> See Full Details </a>
                    </div>
                    <div class="col-md-2 light"></div>
                </div>
                            
                
                
                <jsp:scriptlet>  
                  }
                </jsp:scriptlet>
                
            <jsp:include page="footer.jsp"></jsp:include>
        </div>   

    </body>
</html>
