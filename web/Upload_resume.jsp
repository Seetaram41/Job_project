<%-- 
    Document   : Upload_resume
    Created on : 3 Mar, 2023, 11:40:02 AM
    Author     : Seeta Ram
--%>
<jsp:scriptlet>
    String profile_pic = (String) session.getAttribute("session_profile_pic_path");
</jsp:scriptlet>

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
            <jsp:include page="profile_menubar.jsp"></jsp:include> <br>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 profile_border">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="profile_pics\<jsp:expression>profile_pic</jsp:expression>" height="100">
                        </div>
                        <div class="col-md-6 ">
                            <form action="Upload_Resume" method="post"  enctype="multipart/form-data">
                                <h3>Upload resume</h3>
                                <br>
                                <input type="file" name="uploadresume">

                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" value="Update" class="btn btn-success">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
                <div class ="col-md-2"></div>
        </div><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
