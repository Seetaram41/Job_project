<%-- 
    Document   : Add_experience_details
    Created on : 22 Feb, 2023, 1:46:32 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String profile_pic = (String)session.getAttribute("session_profile_pic_path");
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
            <jsp:include page="profile_menubar.jsp"></jsp:include> <br>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 profile_border">
                        <form method="post" action="Add_Experience_Details">
                            <div class="row">
                                <div class="col-md-3">
                                    <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" >
                                </div>
                                <div class="col-md-9">
                                    <h3>Add Experince</h3><br>
                                    <table>                        
                                        <tr>
                                            <td><h6>Company</h6></td>
                                            <td><input type="text" name="company" class="Add_Profile_form" placeholder="Company Name"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>department</h6></td>
                                            <td><input type="text" name="department" class="Add_Profile_form" placeholder="Department"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>year</h6></td>
                                            <td><input type="text" name="year" class="Add_Profile_form" placeholder="year fg.2016-20%"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>location</h6></td>
                                            <td><input type="text" name="location" class="Add_Profile_form" placeholder="location"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>Achievement</h6></td>
                                            <td><input type="text" name="achievement" placeholder="Certificates/achievements " class="Add_Profile_form"></td>
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
