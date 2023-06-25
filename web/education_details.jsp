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
//    String school = (String) session.getAttribute("Session_school");
//    String field = (String) session.getAttribute("Session_field");
//    String grade = (String) session.getAttribute("session_grade");
//    String year = (String) session.getAttribute("session_year");
//    String achievement = (String) session.getAttribute("session_achievement");
//
//    if (school == null || school == "") {
//        school = "";
//    }
//    if (field == null || field == "") {
//        field = "";
//    }
//    if (grade == null || grade == "") {
//        grade = "";
//    }
//    if (year == null || year == "") {
//        year = "";
//    }
//    if (achievement == null || achievement == "") {
//        achievement = "";
//    }
    String id = request.getParameter("id");
    session.setAttribute("session_id", id);
    String school = "", field = "", grade = "", year = "", achievement = "";
    String profile_pic = (String)session.getAttribute("session_profile_pic_path");

    Connection con = Database_Connect.getConnection();
    PreparedStatement ps = con.prepareStatement("select*from education_details where id = ?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        school = rs.getString("school");
        field = rs.getString("field");
        grade = rs.getString("grade");
        year = rs.getString("year");
        achievement = rs.getString("achievement");

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
                        <form method="post" action="Edit_Education_Details">
                            <div class="row">
                                <div class="col-md-3">
                                     <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" class="profile_img"> 
                                </div>
                                <div class="col-md-9">
                                    <h4>Education Details </h4>
                                    <h6><jsp:expression>name</jsp:expression></h6>
                                <h6><jsp:expression>email</jsp:expression></h6>
                                    <table>
                                        <tr>
                                            <td>School/College : </td>
                                            <td><input type="text" name="school" value="<jsp:expression>school</jsp:expression>" placeholder="school/college" class="Add_Profile_form"></td>
                                        </tr>
                                        <tr>
                                            <td>Field</td>
                                            <td><input type="text" name="field" value="<jsp:expression>field</jsp:expression>" placeholder="field" class="Add_Profile_form"></td>
                                        </tr>
                                        <tr>
                                            <td>Grade</td>
                                            <td><input type="text" name="grade" value="<jsp:expression>grade</jsp:expression>" placeholder="grade %" class="Add_Profile_form"></td>
                                        </tr>
                                        <tr>
                                            <td>Year  </td>
                                            <td><input type="text" name="year" value="<jsp:expression>year</jsp:expression>" placeholder="eg.2016-20" class="Add_Profile_form"></td>
                                        </tr>
                                        <tr>
                                            <td>Achievment </td>
                                            <td><input type="text" name="achievement" value="<jsp:expression>achievement</jsp:expression>" placeholder="acheivment" class="Add_Profile_form"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-9">
                                    <input type="submit" value="Update" class="btn btn-success">
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
