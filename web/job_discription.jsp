<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String)session.getAttribute("session_email");
    String name = (String)session.getAttribute("session_name");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
         <link rel="stylesheet" type="text/css" href="css/newcss.css">
    </head>
    <body>
        <div class="container-fluid">
           
            <jsp:scriptlet>
                if (email == null ? email == null : email.trim().equals("null")) {
            </jsp:scriptlet>
            
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>
            
            <jsp:scriptlet>
            
            } else {
                    
            </jsp:scriptlet>
            
             <jsp:include page="profile_header.jsp"></jsp:include>
              <jsp:include page="profile_menubar.jsp"></jsp:include>
              
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
              
            
        <div class="row">
                    <div class="col-md-3">
                        <ul>
                            <li> <a href=""> Smart Programming </a> </li>
                            <li> <a href=""> Infosys </a> </li>
                            <li> <a href=""> Wipro </a> </li>
                            <li> <a href=""> IBM </a> </li>
                            <li> <a href=""> Google </a> </li>
                        </ul>
                    </div>
            <div class="col-md-6">
            <jsp:scriptlet>
                
                String jid = request.getParameter("jid");
                String id = "", job_profile = "", company = "", experience = "", discription = "", date1 = "", time1 = ""
                           ,salary = "", no_of_opening = "", job_location = "", time_venue = "", c_email = "",
                            c_person_name = "", c_person_profile = "", c_phone_no = "";
                
                Connection con = Database_Connect.getConnection();
                String sql = "select*from jobs where id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, jid);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("Company");
                                    experience = rs.getString("experience");
                                    discription = rs.getString("discription");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                                    salary = rs.getString("salary");
                                    no_of_opening = rs.getString("no_of_opening");
                                    job_location = rs.getString("job_location");
                                    time_venue = rs.getString("time_venue");
                                    c_email = rs.getString("c_email");
                                    c_person_name = rs.getString("c_person_name");
                                    c_person_profile = rs.getString("c_person_profile");
                                    c_phone_no = rs.getString("c_phone_no");
                }
                  </jsp:scriptlet>
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><b><jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-home"></span></td>
                                    <td><span style="color: #9f9d9d"> Company : </span></td>
                                    <td><jsp:expression>company</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-briefcase"></span></td>
                                    <td><span style="color: #9f9d9d"> Experience : </span></td>
                                    <td><jsp:expression>experience</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-list-alt"></span></td>
                                    <td><span style="color: #9f9d9d">Job Description: </span></td>
                                    <td><jsp:expression>discription</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-usd"></span></td>
                                    <td><span style="color: #9f9d9d"> Salary : </span></td>
                                    <td><jsp:expression>salary</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-th"></span></td>
                                    <td><span style="color: #9f9d9d">  No. Of Openings : : </span></td>
                                    <td><jsp:expression>no_of_opening</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-map-marker"></span></td>
                                    <td><span style="color: #9f9d9d"> Job Location : </span></td>
                                    <td><jsp:expression>job_location</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-send"></span></td>
                                    <td><span style="color: #9f9d9d"> Time / Venue : </span></td>
                                    <td><jsp:expression>time_venue</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>Company Details</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-file"></span></td>
                                    <td><span style="color: #9f9d9d"> Company Name : </span></td>
                                    <td><jsp:expression>company</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> </td>
                                    <td><span style="color: #9f9d9d"> Person Name : </span></td>
                                    <td><jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>)</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> </td>
                                    <td><span style="color: #9f9d9d"> Person Name : </span></td>
                                    <td><jsp:expression>c_person_profile</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>)</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-phone-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Phone No. : </span></td>
                                        <td><jsp:expression>c_phone_no</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-phone-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Phone No. : </span></td>
                                    <td><jsp:expression>c_email</jsp:expression></td>
                                </tr>
                            <jsp:scriptlet>
                             if(email == null ? email == null : email.trim().equals("null")){
                               
                            </jsp:scriptlet>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><a href="login.jsp" class="btn btn-primary">Login to Apply</a></td>
                                </tr>
                            <jsp:scriptlet>
                             }
                             else{ 
                                 Connection con1 = Database_Connect.getConnection();
                                 String sql1="select*from applied_job where jobid=? and email=?";
                                 PreparedStatement ps1 = con1.prepareStatement(sql1);
                                 ps1.setString(1, jid);
                                 ps1.setString(2, email);
                                 ResultSet rs1 = ps1.executeQuery();
                                 if(rs1.next()){
                            </jsp:scriptlet>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><a href="login.jsp" class="btn btn-alert">Already Applied</a></td>
                                </tr>
                            <jsp:scriptlet>
                             }
                                 else{
                            </jsp:scriptlet> 
                                <tr>
                                    <td><input type="hidden" name="jid"></td>
                                    <td></td>
                                    <td> <form action="ApplyForJob" method="post">
                                          <input type="hidden" value="<jsp:expression>jid</jsp:expression>" name="jid" />
                                          <input type="submit" value="Apply" class="btn btn-primary"/>
                                        </form>
                                    </td>
                                </tr>
                            <jsp:scriptlet>   
                             }  
                            }  
                            </jsp:scriptlet>    
                            
                   </table>
                
               </div>
                <div class="col-md-3">
                    <ul>
                        <li> <a href=""> Smart Programming </a> </li>
                        <li> <a href=""> Infosys </a> </li>
                        <li> <a href=""> Wipro </a> </li>
                        <li> <a href=""> IBM </a> </li>
                        <li> <a href=""> Google </a> </li>
                    </ul>
                </div>
            </div>
           <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
