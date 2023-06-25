<%-- 
    Document   : validation
    Created on : 2 Feb, 2023, 9:36:32 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script >

            function validation() {
                var name_pattern = /^[a-zA-Z]{3,30}$/;
                var user_name = document.form1.name1.value;

                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var user_email = document.form1.email1.value;

                var pass_pattern = /^[a-zA-Z0-9@]{6,100}/;
                var user_pass = document.form1.pass1.value;

                var number_pattern = /^[0-9]{10}$/;
                var user_number = document.form1.number1.value;

                var gender = document.form1.gender1.value;

                if (!user_name.match(name_pattern)) {
                    document.getElementById("s_name").innerHTML = "alphabet at least 3 char";
                    return false;
                }
                else if (!user_email.match(email_pattern)) {
                    document.getElementById("s_email").innerHTML = "Enter valid email";
                    return false;
                }
                else if (!user_pass.match(pass_pattern)) {
                    document.getElementById("s_pass").innerHTML = "required lenght at least 6";
                    return false;
                }
                else if (!user_number.match(number_pattern)) {
                    document.getElementById("s_number").innerHTML = "must should 10 digit";
                    return false;
                }
                else if (gender == "" || gender == null) {
                    document.getElementById("s_gender").innerHTML = "Enter valid gender";
                    return false;
                }
                else {
                    document.getElementById("s_reg").innerHTML = "valid ";
                }
            }
            function clearSpan(a) {
                document.getElementById(a).innerHTML = "";
            }
        </script>
    <body>
        <form name="form1" onsubmit="return validation()" method="post"  action="reg">
            <h1 style="color: blue;">SignUP here</h1>
            <table>
                <tr> 
                    <td> Enter Name      : </td>
                    <td> <input type="text" placeholder="Enter name " name="name1" onkeyup="clearSpan('s_name')"  > <br><span id="s_name" style="color: red ; font-size : 12px ;"></span> </td>
                </tr>
                <tr> 
                    <td>Enter Email        :</td>
                    <td><input type="email" placeholder="Enter email" name="email1"  onkeyup="clearSpan('s_email')" > <br><span id="s_email" style="color: red;  font-size : 12px ;"></span> </td>
                </tr>
                <tr> 
                    <td>Enter Password :</td>
                    <td> <input type="password" placeholder="Enter password " name="pass1"  onkeyup="clearSpan('s_pass')" > <br><span id="s_pass" style="color: red;  font-size : 12px ;"></span> </td>
                </tr>
                <tr> 
                    <td>Enter Number  : </td>
                    <td><input type="text" placeholder="Phone number " name="number1"  onkeyup="clearSpan('s_number')" > <br><span id="s_number" style="color: red;  font-size : 12px ;"></span></td>
                </tr>
                <tr>
                    <td>Select Gender</td>
                    <td> <input type="radio" name="gender1" value="Male"   >Male <input type="radio" name="gender1" value="Female">Female <input type="radio" name="gender1" value="Other"  >Other <br><span id="s_gender" style="color: red; font-size : 12px ;"></span> </td>
                </tr>

                <tr> 
                    <td><input type="submit" value="SignUp"> <br><span id="s_reg" style="color: green; "></span></td>
                    <td><input type="reset" value="clear"> </td>
                </tr>

            </table>   
            <br>              
        </form>
    </body>
</html>
