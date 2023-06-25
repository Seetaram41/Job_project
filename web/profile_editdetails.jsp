<%-- 
    Document   : profile_editdetails
    Created on : 19 Feb, 2023, 2:49:45 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String dob = (String) session.getAttribute("session_dob");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String skills = (String) session.getAttribute("session_skills");
    String title = (String) session.getAttribute("session_title");
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
            <jsp:include page="profile_menubar.jsp"></jsp:include>    
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <form action="Add_Personal_Details" method="post">
                            <div class="row profile_border">
                                <div class="col-md-3">
                                    <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100"> 
                                </div>
                                <div class="col-md-9">

                                    <h3 class="profile_blue">Personal Details<br></h3>
                                    <span><h6>(<jsp:expression>email</jsp:expression>)</h6></span><br>
                                    <table>
                                        <tr>
                                            <td><h6>Skills    </h6></td>
                                            <td><input type="text" name="skills" placeholder="Enter skils" value="<jsp:expression>skills</jsp:expression>"</td>
                                        </tr>
                                        <tr>
                                            <td><h6>Tital    </h6></td>
                                            <td><input type="text" name="title" placeholder="Enter title" value="<jsp:expression>title</jsp:expression>"</td>
                                        </tr>
                                        <tr>
                                            <td><h6>Name    </h6></td>
                                            <td><input type="text" name="name" placeholder="Enter name" value="<jsp:expression>name</jsp:expression>"</td>
                                        </tr> 
                                        <tr>
                                            <td><h6>DOB    </h6></td>
                                            <td> <input type="text" name="dob" placeholder="Enter dob" value="<jsp:expression>dob</jsp:expression>"></td>
                                        </tr> 
                                        <tr>
                                            <td><h6>Gender </h6></td>
                                            <td><input type="text" name="gender" placeholder="Enter gender" value="<jsp:expression>gender</jsp:expression>"</td>
                                        </tr>
                                        <tr>
                                            <td><h6>City  </h6></td>
                                            <td><input type="text" name="city" placeholder="Enter city" value="<jsp:expression>city</jsp:expression>"</td>
                                        </tr> 
                                    </table>                          
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                    <input type="submit" value="Update" class="btn btn-success">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
