<%-- 
    Document   : simple_job_search
    Created on : 22 Jun, 2023, 3:36:32 PM
    Author     : Seeta Ram
--%>
<%-- 
    Document   : profile_homepage
    Created on : 19 Feb, 2023, 10:54:50 AM
    Author     : Seeta Ram
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaClasses.Database_Connect"%>
<%@page import="java.sql.Connection"%>
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
        <script>
            function searchJobByTech(tech)
            {
                //alert(tech);
                
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByTechnology?technology="+tech, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            function searchJobByLocation(location)
            {
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByLocation?location="+location, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
        </script>
        
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
              
              
                <div class="row" style="background-color: #e7e4f5">
                    <div class="col-md-2 "></div>
                    <div class="col-md-8 job_search_div">
                        <h1>Search job</h1>
                        <input type="text" onkeyup="searchJobByTech(this.value)" placeholder="technology..." class="find_job_input ">
                        <br>OR<br>
                        <input type="text" onkeyup="searchJobByLocation(this.value)" placeholder="location..." class="find_job_input">
                    </div> 
                    <div class="col-md-2"></div>
                </div>
              <!-- ==============search job div ends================= -->

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
                    <div class="col-md-6" style="background-color: #f9f8f9; margin-top: 10px">
                        <div class="row">
                            <div class="col-md-12">
                                <span id="respgenerated"> No Result Found </span>
                            </div>
                        </div>
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
