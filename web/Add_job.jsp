<%-- 
    Document   : Add_job
    Created on : 21 Jun, 2023, 2:15:37 PM
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
        <jsp:include page="header.jsp"></jsp:include>
         <jsp:include page="menubar.jsp"></jsp:include>
         <div class="container">
             <h1>Add Job details</h1>
             <form action="Add_Job" method="post">
                 <table class="table table-bordered table-hover">
                 <tr>
                     <th>Job profile</th>
                     <td><input type="text" placeholder="job_profile" name="job_profile" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>Company</th>
                     <td><input type="text" placeholder="company" name="company" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>experience</th>
                     <td><input type="text" placeholder="experience" name="experience" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>salary</th>
                     <td><input type="text" placeholder="salary" name="salary" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>no_of_opening</th>
                     <td><input type="text" placeholder="no_of_opening" name="no_of_opening" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>job_location</th>
                     <td><input type="text" placeholder="job_location" name="job_location" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>time_venue</th>
                     <td><input type="text" placeholder="time_venue" name="time_venue" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>discription</th>
                     <td><input type="text" placeholder="discription" name="discription" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>c_email</th>
                     <td><input type="text" placeholder="c_email" name="c_email" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>c_person_name</th>
                     <td><input type="text" placeholder="c_person_name" name="c_person_name" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>c_person_profile</th>
                     <td><input type="text" placeholder="c_person_profile" name="c_person_profile" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>c_phone_no</th>
                     <td><input type="text" placeholder="c_phone_no" name="c_phone_no" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>date1</th>
                     <td><input type="text" placeholder="date1" name="date1" class="add_job_width"></td>
                 </tr>
                 <tr>
                     <th>time1</th>
                     <td><input type="text" placeholder="time1" name="time1"class="add_job_width"></td>
                 </tr>
                 
                 <tr>
                     <td><input type="submit" value="add Job" class="btn btn-primary"></td>
                 </tr>
             </table>
                 
             </form>
         </div>
         <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
