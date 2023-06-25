<%-- 
    Document   : contact_us
    Created on : 24 Jun, 2023, 3:31:32 PM
    Author     : Seeta Ram
--%>

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
                    <div class="col-md-3 padding">
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
                    if(email == null ? email == null : email.trim().equals("null"))
                    {
                    </jsp:scriptlet>
                    <jsp:include page="noUserContact_us.jsp"></jsp:include>
                    <jsp:scriptlet>
                    }
                    else
                    {
                    </jsp:scriptlet>
                    <jsp:include page="userContact_us.jsp"></jsp:include>
                    <jsp:scriptlet>
                    }
                    </jsp:scriptlet>
                    </div>
                    <div class="col-md-3 padding">
                        <ul>
                            <li> <a href=""> Smart Programming </a> </li>
                            <li> <a href=""> Infosys </a> </li>
                            <li> <a href=""> Wipro </a> </li>
                            <li> <a href=""> IBM </a> </li>
                            <li> <a href=""> Google </a> </li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1000.611528507549!2d76.70699078730385!3d30.712056204048775!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x616dfc7292ce7034!2sSmart%20Programming!5e0!3m2!1sen!2sin!4v1608027138020!5m2!1sen!2sin" width="100%" height="150" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                    <div class="col-md-2"></div>
                </div>
               
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        
        
    </body>
</html>
