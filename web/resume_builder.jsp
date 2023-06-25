<%-- 
    Document   : resume_builder
    Created on : 19 Jun, 2023, 8:21:02 PM
    Author     : Seeta Ram
--%>

<%-- 
    Document   : education_Details
    Created on : 20 Feb, 2023, 6:42:02 PM
    Author     : Seeta Ram
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    
    String email = (String) session.getAttribute("session_email");
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String)session.getAttribute("session_profile_pic_path");
    
    String dob ="",gender="";
    Connection con =null;
    con = Database_Connect.getConnection();
    String sql_query1="select*from register where email=?";
    PreparedStatement ps1 = con.prepareStatement(sql_query1);
    ps1.setString(1, email);
    ResultSet rs1 = ps1.executeQuery();
    while(rs1.next()){
        dob = rs1.getString("dob");
        gender = rs1.getString("gender");
    }
    
    String address="", career="", hobbies="", language="", marital="";
    Connection con2 = Database_Connect.getConnection();
    String sql_query4 = "select *from resume_builder where email=?";
    PreparedStatement ps4 =con2.prepareStatement(sql_query4);
    ps4.setString(1, email);
    ResultSet rs4 = ps4.executeQuery();
    while(rs4.next()){
        address = rs4.getString("address");
        career = rs4.getString("career");
        hobbies = rs4.getString("hobbies");
        language = rs4.getString("language");
        marital = rs4.getString("marital");        
    }
    
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
        <div class="container-fluid">
            <jsp:include page="profile_header.jsp"></jsp:include>
            <jsp:include page="profile_menubar.jsp"></jsp:include><br> 
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 profile_border" >
                        <form method="post" action="Resume_Builder">
                            <div class="row">
                                <div class="col-md-2">
                                     <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" class="profile_img"> 
                                </div>
                                <div class="col-md-10">
                                    <h3>Resume Builder Details </h3><br>
                                
                                    <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Name</th>
                                        <td><jsp:expression>name</jsp:expression></td>
                                    </tr>
                                
                                     <tr>
                                         <th>Email</th>
                                         <td><jsp:expression>email</jsp:expression></td>
                                    </tr>
                                </table>
                               <br>
                               <input name="address" value="<jsp:expression>address</jsp:expression>" placeholder="Address" class="textarea_design">
                               <input name="career_objective" value="<jsp:expression>career</jsp:expression>"  placeholder="Career Objective"  class="textarea_design"><br><br>
                                
                                <b>Education Details-</b><br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>School/College</th>
                                        <th>Year</th>
                                        <th>Field</th>
                                        <th>Grade</th>
                                    </tr>
                                
                                <jsp:scriptlet>
                                  String school="",year="", field="",grade="";
                                  String sql_query2 ="select*from education_details where email =?;";
                                  PreparedStatement ps2 = con.prepareStatement(sql_query2);  
                                  ps2.setString(1, email);
                                  ResultSet rs2 = ps2.executeQuery();
                                  while(rs2.next()){
                                    school = rs2.getString("school");
                                    year =  rs2.getString("year");
                                    field = rs2.getString("field");
                                    grade = rs2.getString("grade");
                                    
                                </jsp:scriptlet>
                                    <tr>
                                        <td><jsp:expression>school</jsp:expression></td>
                                        <td><jsp:expression>year</jsp:expression></td>
                                        <td><jsp:expression>field</jsp:expression></td>
                                        <td><jsp:expression>grade</jsp:expression></td>
                                    </tr>
                                  
                                <jsp:scriptlet>
                                  }                               
                                </jsp:scriptlet>
                             </table>
                                    
                                    
                                <b>Experience Details-</b><br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Company</th>
                                        <th>Location</th>
                                        <th>Year</th>
                                        <th>Department</th>
                                    </tr>
                                
                                <jsp:scriptlet>
                                  String company="",location="", year2="",department ="";
                                  String sql_query3 ="select*from experience_details where email =?;";
                                  PreparedStatement ps3 = con.prepareStatement(sql_query3);
                                  ps3.setString(1, email);
                                  ResultSet rs3 = ps3.executeQuery();
                                  while(rs3.next()){
                                    company = rs3.getString("company");
                                    location =  rs3.getString("location");
                                    year2 = rs3.getString("year");
                                    department = rs3.getString("department");
                                    
                                </jsp:scriptlet>
                                    <tr>
                                        <td><jsp:expression>company</jsp:expression></td>
                                        <td><jsp:expression>location</jsp:expression></td>
                                        <td><jsp:expression>year</jsp:expression></td>
                                        <td><jsp:expression>department</jsp:expression></td>
                                    </tr>
                                <jsp:scriptlet>
                                  }                               
                                </jsp:scriptlet>
                                
                               </table>
                                
                                
                                <b>Hobbies</b><br>
                                <input name="hobbies" value="<jsp:expression>hobbies</jsp:expression>" placeholder="hobbies" class="textarea_design"><br><br>
                                
                                <b>personal Details</b><br>
                                   <input type="text" name="dob" placeholder="date of birth" value="<jsp:expression>dob</jsp:expression>" class="textfield_design">
                                   <input type="text" name="gender" placeholder="Gender" value="<jsp:expression>gender</jsp:expression>" class="textfield_design">
                                   <input type="text" name="marital_status" value="<jsp:expression>marital</jsp:expression>" placeholder="Marital Status" class="textfield_design">
                                   <input type="text" name="language" value="<jsp:expression>language</jsp:expression>" placeholder="Language proficiency" class="textfield_design">
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-9">
                                    <input type="submit" value="Build Resume" class="btn btn-success">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <br><jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
