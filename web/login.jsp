<%-- 
    Document   : login
    Created on : 29 Jan, 2023, 3:02:03 PM
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
        <script>
            function validation() {
                var email = document.form1.email.value;
                var pass = document.form1.pass.value;

                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var pass_pattern = /^[a-zA-Z0-9@]{6,100}/;


                if (!email.match(email_pattern)) {
                    document.getElementById("email_e").innerHTML = "enter valid email";
                    return false;
                }
                if (!pass.match(pass_pattern)) {
                    document.getElementById("pass_e").innerHTML = "required must 6 length";
                    return false;
                }
            }
            function val(v) {
                document.getElementById(v).innerHTML = "";
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>   
                <div class="row">
                    <div class="col-md-12 form_bg">
                        <form class="form_login" method="post" action="Login" name="form1" onsubmit="return validation()">
                            <h4>Login Here</h4>
                            <input type="email" placeholder="Enter email" name="email" class="login_form" onkeyup="val('email_e')"><br>
                            <span id="email_e" style="color: red; font-size : 12px; margin-right: 370px;"> </span><br>

                            <input type="text" placeholder="Enter Password " name="pass" class="login_form" onkeyup="val('pass_e')"><br>
                            <span id="pass_e" style="color: red; font-size : 12px; margin-right: 330px;"> </span><br>
                            <input type="submit" value="Login" class="btn btn-primary"><br><br>
                        </form>
                    </div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
