<%-- 
    Document   : loginerror
    Created on : 2 Feb, 2023, 3:06:46 PM
    Author     : Seeta Ram
--%>

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
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>
                <div class=" alert alert-danger" role="alert">
                    *invalid email & password
                </div>
                <div class="row">
                    <div class="col-md-12 form_bg">
                        <form class="form_login"method="post" action="login">
                            <h4>Login Here</h4>
                            <input type="email" placeholder="Enter email" name="email" class="login_form"><br>
                            <input type="text" placeholder="Enter Password " name="pass" class="login_form"><br>
                            <input type="submit" value="Login" class="btn btn-primary"><br><br>
                        </form>
                    </div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
