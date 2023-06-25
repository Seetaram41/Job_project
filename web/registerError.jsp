<%-- 
    Document   : registerError
    Created on : 2 Feb, 2023, 3:37:12 PM
    Author     : Seeta Ram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registerError</title>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML = "";
            }
            function validation()
            {


                var name = document.regform.name.value;
                var email = document.regform.email.value;
                var number = document.regform.number.value;
                var dob = document.regform.dob.value;
                var pass = document.regform.pass.value;
                var gender = document.regform.gender.value;
                //var fields2=document.regform.field1.value;
                var city = document.regform.city.value;


                var name_pattern = /^[a-z A-Z]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var number_pattern = /^[0-9]{10}$/;
                var pass_pattern = /^[a-zA-Z0-9@]{6,100}/;
                var dob_pattern = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;



                if (!name.match(name_pattern))
                {
                    document.getElementById('name_e').innerHTML = "Alphabet at least 3 char";
                    return false;
                }
                if (!email.match(email_pattern))
                {
                    document.getElementById('email_e').innerHTML = "Enter Valid Email";
                    return false;
                }
                if (!number.match(number_pattern))
                {
                    document.getElementById('number_e').innerHTML = "Must Should 10 digit";
                    return false;
                }
                if (!dob.match(dob_pattern))
                {
                    document.getElementById('dob_e').innerHTML = "Required dd/mm/yyyy Formate";
                    return false;
                }
                if (!pass.match(pass_pattern))
                {
                    document.getElementById('pass_e').innerHTML = "Required lenght at least 6";
                    return false;
                }
                if (gender === "" || null)
                {
                    document.getElementById('gender_e').innerHTML = "Please select gender";
                    return false;
                }
                if (city === "Select city")
                {
                    document.getElementById('city_e').innerHTML = "Please select city";
                    return false;
                }
                return true;
            }
        </script>
    </head>


    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>            
                <div class=" alert alert-danger" role="alert">
                    *User Already Exist
                </div>
                <div class="row form_bg">

                    <div class="col-md-12">
                        <form method="Post"  class="form_register" name="regform" onsubmit="return validation()" action="reg"> 
                            <h4 style="padding-top:15px;">Register Here</h4>

                            <input type="text" placeholder="Enter name " name="name"  onkeyup="val('name_e')" class ="register_form"><br>
                            <span id="name_e" style="color: red; font-size : 12px; margin-right: 360px;"></span><br>

                            <input type="email"placeholder="Enter email" name="email" onkeyup="val('email_e')" class ="register_form" ><br>
                            <span id="email_e" style="color: red; font-size : 12px; margin-right: 360px;"></span><br>

                            <input type="text" placeholder="Enter Phone No " name="number" onkeyup="val('number_e')" class ="register_form"><br>
                            <span id="number_e" style="color: red; font-size : 12px; margin-right: 347px;"></span><br>

                            <input type="text" placeholder="Enter DOB " name="dob" onkeyup="val('dob_e')" class ="register_form"><br>
                            <span id="dob_e" style="color: red; font-size : 12px; margin-right: 365px;"></span><br>

                            <input type="text" placeholder="Enter Password" name="pass" onkeyup="val('pass_e')" class ="register_form"><br>
                            <span id="pass_e" style="color: red; font-size : 12px; margin-right: 338px;"></span><br>

                            <h6 style="display: inline-block">Gender :</h6> Male<input type="radio" onkeyup="val('gender_e')" name="gender" value="male"> 
                            Female<input type="radio" onkeyup=" val('gender_e')" name="gender"  value="Female">
                            Other<input type="radio" onkeyup=" val('gender_e')" name="gender" value="other">
                            <br><span id="gender_e" style="color: red; font-size : 12px;"></span><br>

                            <h6 style="display: inline-block">City :</h6>
                            <select name="city" >
                                <option>Select city</option>
                                <option>Bhopal</option>
                                <option>Indore</option>
                                <option>Delhi</option>
                                <option>Chandigarh</option>
                                <option>Mandideep</option>
                            </select><br>
                            <span id="city_e" style="color: red; font-size : 12px;"></span><br>
                            <input type="submit"value="Register" style="margin-bottom: 15px;" class="btn btn-success"> <input style="margin-bottom: 15px;" type="reset" value="Clear" class="btn btn-primary">
                        </form> 
                    </div>

                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
