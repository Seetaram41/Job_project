<%-- 
    Document   : Add_education_details
    Created on : 20 Feb, 2023, 10:49:36 PM
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
                        <form method="post" action="Add_Education_Details">
                            <div class="row">
                                <div class="col-md-3"><img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100"></div>
                                <div class="col-md-9">
                                    <h3>Add Education</h3><br>

                                    <table>                        
                                        <tr>
                                            <td><h6>Eduaction From</h6></td>
                                            <td><input type="text" name="school" class="Add_Profile_form" placeholder="Education From"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>Field</h6></td>
                                            <td><input type="text" name="field" class="Add_Profile_form" placeholder="eg. B.tech/M.tech/Bsc"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>Grade</h6></td>
                                            <td><input type="text" name="grade" class="Add_Profile_form" placeholder="fg.60%"></td>
                                        </tr>
                                        <tr>
                                            <td><h6>Time peried</h6></td>
                                            <td><input type="text" name="year" class="Add_Profile_form" placeholder="eg. 2016-20"></td>
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
