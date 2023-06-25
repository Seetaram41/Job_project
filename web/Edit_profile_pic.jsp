<%-- 
    Document   : Edit_profile_pic
    Created on : 27 Feb, 2023, 1:43:38 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String profile_pic = (String) session.getAttribute("session_profile_pic_path");
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
                        <form action="Edit_Profile_pic" method="post" enctype="multipart/form-data">
                            <div class="row profile_border">
                                <div class="col-md-3">
                                    <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" class="profile_img"> 
                                </div>
                                <div class="col-md-9">

                                    <h3 class="profile_blue">Edit Profile Pic</h3>
                                    <h5><jsp:expression>name</jsp:expression></h5>
                                    <h6><span>(<jsp:expression>email</jsp:expression>)</span><br></h6><br>
                                    <input type="file" name="upload-file">
                                    <br><br>
                                    <input type="submit" value="Upload pic" class="btn btn-success">
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
