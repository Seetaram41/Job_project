
<%@page import="JavaClasses.Path_Details"%>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String number = (String) session.getAttribute("session_number");
    String dob = (String) session.getAttribute("session_dob");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String skills = (String) session.getAttribute("session_skills");
    String title = (String) session.getAttribute("session_title");
    String email = (String) session.getAttribute("session_email");
    String path = (String) session.getAttribute("session_resume_path");

    String resume_path = "";
    Connection con1 = Database_Connect.getConnection();
    String sql_query1 = "select*from resume where email = ?";
    PreparedStatement ps1 = con1.prepareStatement(sql_query1);
    ps1.setString(1, email);
    ResultSet rs1 = ps1.executeQuery();
    while (rs1.next()) {
        resume_path = rs1.getString("path");
    }

    String profile_pic = (String) session.getAttribute("session_profile_pic_path");
    if (skills == null || skills == "") {
        skills = "";
    }
    if (title == null || title == "") {
        title = "";
    }
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
                        <div class="row profile_border">
                            <div class="col-md-3">
                                <div style="width: 100px; height:100px; margin-left: 50px; position: relative;border-radius: 10px">
                                    <a href="Edit_profile_pic.jsp" style="z-index: 20;position: absolute"><span>&#9960;</span></a>
                                    <img style="background-size: cover;width: 100%; height: 100%;" class="profile_img" src="profile_pics\<jsp:expression>profile_pic</jsp:expression>"  height="100"> 
                            </div>
                        </div>
                        <div class="col-md-9">
                            <h3 class="profile_blue"><jsp:expression>name.toUpperCase()</jsp:expression><span class="profile_icon"><a href="profile_editdetails.jsp">edit details</a></span><br></h3>
                            <span><b class="profile_icon2">

                                    (<jsp:expression>email</jsp:expression>)
                                </b></span>
                            <h6><jsp:expression>title</jsp:expression></h6>
                        <h6><jsp:expression>skills</jsp:expression></h6>  
                        <h6> <jsp:expression>city</jsp:expression>,<jsp:expression>number</jsp:expression></h6>
                            <h6></h6>
                        </div>
                    </div>
                    <br>



                    <!-- ***********************************Start Education-->
                    <div class="row">  
                        <div class="col-md-12 profile_border">
                            <h4>Education Details<span class="profile_icon"><a href="Add_education_details.jsp">add details</a></span></h4>
                        <jsp:scriptlet>
                            response.setContentType("text/html");

                            String school = "", field = "", grade = "", id = "";

                            try {
                                Connection con = Database_Connect.getConnection();
                                PreparedStatement ps = con.prepareStatement("select*from education_details where email= ?");
                                ps.setString(1, email);
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    school = rs.getString("school");
                                    field = rs.getString("field");
                                    grade = rs.getString("grade");
                        </jsp:scriptlet>
                        <div class="row" style="background-color:#d2d1d1">
                            <div class="col-md-2 "><img src="images/school.png" height="50px"></div>
                            <div class="col-md-10">
                                <span class="profile_icon"><a href="education_details.jsp?id=<jsp:expression>id</jsp:expression>">edit details</a></span>
                                <b><jsp:expression>school</jsp:expression></b>
                                <h6><jsp:expression>field</jsp:expression></h6>
                                <h6><jsp:expression>grade</jsp:expression></h6>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        <jsp:scriptlet>
                                }
                            } catch (Exception e) {
                                out.print(e);
                            }
                        </jsp:scriptlet>
                    </div>
                </div>
                <!--***************************************** End Education Details -->   



                <!--***************************************** Start Experience -->
                <br>
                <div class="row">  
                    <div class="col-md-12 profile_border">
                        <h4>Experience Details<span class="profile_icon"><a href="Add_experience_details.jsp">add details</a></span></h4>
                        <jsp:scriptlet>
                            response.setContentType("text/html");

                            String company = "", department = "", year = "", location = "", achievement = "";

                            try {
                                Connection con = Database_Connect.getConnection();
                                PreparedStatement ps = con.prepareStatement("select*from experience_details where email= ?");
                                ps.setString(1, email);
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    company = rs.getString("company");
                                    department = rs.getString("department");
                                    year = rs.getString("year");
                                    location = rs.getString("location");
                                    achievement = rs.getString("achievement");
                        </jsp:scriptlet>

                        <div class="row" style="background-color:#d2d1d1">
                            <div class="col-md-2 "><img src="images/experience.png" height="50px"></div>
                            <div class="col-md-10">
                                <span class="profile_icon"><a href="edit_experience_details.jsp?id=<jsp:expression>id</jsp:expression>">edit details</a></span>
                                <b><jsp:expression>company</jsp:expression></b>
                                <h6><jsp:expression>department</jsp:expression> <jsp:expression>year</jsp:expression> </h6>
                                <h6><jsp:expression>location</jsp:expression>,<jsp:expression>achievement</jsp:expression></h6>
                                    <h6></h6>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        <jsp:scriptlet>

                                }
                            } catch (Exception e) {
                                out.print(e);
                            }
                        </jsp:scriptlet>
                    </div>
                </div>
                <!-- ***************************************End Experience details*****************-->



                <!--***************************************** Start Resume Details --> 
                <br>
                <div class="row">  
                    <div class="col-md-12 profile_border">
                        <h4>Resume Details</h4>
                        <br>
                        <div class="row" style="background-color:#d2d1d1">
                            <div class="col-md-3" >
                                <a href="Upload_resume.jsp"class="btn btn-primary">Upload resume</a>
                            </div>
                            <div class="col-md-7">

                                <jsp:scriptlet>
                                    response.setContentType("text/html");
                                    if (path == "") {
                                </jsp:scriptlet>
                                <jsp:expression>path</jsp:expression>

                                <jsp:scriptlet>

                            } else {
                                </jsp:scriptlet>
                                <a class="btn btn-success" href="Download_Resume?fn=<jsp:expression>resume_path</jsp:expression>"> Download </a>

                                <jsp:scriptlet>

                                    }
                                </jsp:scriptlet>

                            </div>
                        </div><br>
                        <div class="row" style="background-color:#d2d1d1">
                            <div class="col-md-3">
                                <a href="resume_builder.jsp" class="btn btn-primary">Resume builder</a>
                            </div>
                            <div class="col-md-9">
                                <jsp:scriptlet>
                                File f = new File(Path_Details.RESUME_BUILDER_PATH + email + ".pdf");
                                if (f.exists()) {
                                </jsp:scriptlet>
                                <a class="btn btn-success">Download</a>
                                <jsp:scriptlet>
                                    }
                                </jsp:scriptlet>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
</body>
</html>
