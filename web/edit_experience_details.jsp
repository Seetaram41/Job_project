<%-- 
    Document   : edit_experience_details
    Created on : 22 Feb, 2023, 12:23:09 PM
    Author     : Seeta Ram
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
<jsp:scriptlet>

    String email = (String) session.getAttribute("session_email");
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String) session.getAttribute("session_profile_pic_path");

    String id = request.getParameter("id");
    session.setAttribute("session_id", id);
    session.setAttribute("session_id", id);
    String company = "", department = "", year = "", location = "", achievement = "";

    Connection con = Database_Connect.getConnection();
    PreparedStatement ps = con.prepareStatement("select*from experience_details where id = ?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        company = rs.getString("company");
        department = rs.getString("department");
        year = rs.getString("year");
        location = rs.getString("location");
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
                    <div class="col-md-2"> </div>
                    <div class="col-md-8 profile_border" >
                        <div class="row">
                            <div class="col-md-3">
                                <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" >
                            </div>
                            <div class="col-md-6">
                                <form method="post" action="Edit_Experience_details">
                                    <h4>Experience Details</h4>
                                    <h6><jsp:expression>name</jsp:expression></h6>
                                    <h6>
                                    <jsp:expression>email</jsp:expression>
                                    </h6>
                                    <table>
                                        <tr>
                                            <td>Company : </td>
                                            <td><input type="text" name="company"  value="<jsp:expression>company</jsp:expression>" placeholder="Company" class="Add_Profile_form"></td>
                                        </tr>

                                        <tr>
                                            <td>Department</td>
                                            <td><input type="text" name="department"  value="<jsp:expression>department</jsp:expression>" placeholder="department" class="Add_Profile_form"></td>
                                        </tr>

                                        <tr>
                                            <td>Year</td>
                                            <td><input type="text" name="year" value="<jsp:expression>year</jsp:expression>" placeholder="year eg.2016-20" class="Add_Profile_form"></td>
                                        </tr>

                                        <tr>
                                            <td>Location  </td>
                                            <td><input type="text" name="location" value="<jsp:expression>location</jsp:expression>" placeholder="location" class="Add_Profile_form"></td>
                                        </tr>

                                        <tr>
                                            <td>Achievment </td>
                                            <td><input type="text" name="achievement" value="<jsp:expression>achievement</jsp:expression>" placeholder="acheivment/certificate" class="Add_Profile_form"></td>
                                        </tr>

                                    </table>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="submit" value="Update" class="btn btn-success">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"> </div>
                </div>
                <br><jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
