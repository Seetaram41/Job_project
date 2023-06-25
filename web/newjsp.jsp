<%-- 
    Document   : newjsp
    Created on : 3 Feb, 2023, 4:56:51 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function validation() {
                var name = document.form1.name.value;
                var pass = document.form1.pass.value;
               
                if(name===""){
                    document.getElementById('name_e').innerHTML="con naot empty";
                    return false;
                }
                
                if(pass===""){
                    document.getElementById('pass_e').innerHTML="can not be empty";
                    return false;
                }
                return true;
            }
            function val(v){
                document.getElementById(v).innerHTML="";
            }
        </script>
    </head>
    <body>
        <form name="form1" method="post" onsubmit="return validation()">
            <h1>register here </h1>
            <input type="text" placeholder="Enter Name : " name="name" onkeyup="val('name_e')" ><br>
            <span id="name_e"></span>
            <input type="text" placeholder="Enter Password : " name="pass"onkeyup="val('pass_e')"><br>
            <span id="pass_e"></span>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
