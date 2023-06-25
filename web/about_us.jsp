<%-- 
    Document   : about_us
    Created on : 25 Jun, 2023, 11:20:35 PM
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
                    <div class="col-md-2"></div>
                    <div class="col-md-8 job_search_div">
                        <h3> About Job Portal </h3>
                    </div>
                    <div class="col-md-2"></div>
                </div>

                <div class="row">
                    <div class="col-md-12"  style="margin: 10px 0">
                        <div class="row">
                            <div class="col-md-12">
                                <img src="images/job-seekers-banner-image.jpg" style="width: 1270px; height: 230px">
                                <p style="color: blue; font-size:16px"> <span style="font-size: 25px">job portal</span> are sites where you can promote jobs and search for resumes. 
                            They are an important part of almost every hiring procedure, 
                            and using them efficiently will interpret into qualified candidates for moderately low costs. </p> <br> <br>
                            </div>
                        </div>
                        
                        <div class="row">
                            <h2 class="center" style="margin-bottom:15px;"> Our Mission </h2>                        
                             <div class="col-md-4">
                                <img width="400px" src="images/mission1.jpeg">
                             </div>
                            <div class="col-md-8">
                                <p>Our mission is to enhance client and candidate satisfaction by increasing the quality of sourcing, 
                                    boost better recruiting practices that are focused on long-term hires and building employer and employee relationships.
                                    We strive to improve the overall process of recruitment online and offline. We put our efforts to increase customer satisfaction, 
                                    to enhance the interaction process between clients and candidates,
                                    and streamline the process for better efficient results, which will result in cost and time saving.
                              </p>
                            </div>
                        </div>
                                
                        <!--  2 misson-->
                         <div class="row">
                                   <div class="col-md-8">
                                       <p>
                                           The business is focused on serving the clients in the Asian and Middle East markets at present. 
                                           Our clients are organization who believe in the importances of hiring the right candidate and are extremely focused on working with us to ensure only the right talent is hired for their open positions.
                                       </p>
                                   </div>
                                   <div class="col-md-4">
                                       <img width="400px" src="images/mission2.jpeg">
                                   </div>
                         </div>   
                        
                        <!--  3 misson-->
                               <div class="row">
                                   <div class="col-md-4">
                                       <img width="400px" src="images/mission3.jpeg">
                                   </div>
                                   <div class="col-md-8">
                                       <p>These markets are growing and there is a lot of opportunity for staffing/ recruitment in the region.
                                           With these regions being in a massive growth mode, there is a huge potential for hiring the right candidates for various positions.
                                       </p>
                                   </div>
                               </div> 
                  </div>
             </div>
              <div class="row" style="margin-top: 30px">
                  <h2 class="center" style="margin: 30px 0;"> Our Core Values </h2>
                  <p>At different points in your professional career it is helpful to identify your core values. These are personal values that guide you when making important decisions and doing work. Determining the values that are meaningful in your life can help you to develop personal and professional goals. It can also help you find jobs and companies that align with your ideals.</p>
                  <h4>How Do I identify My Personal Core Values?</h4>
                  <p>If you’re unsure about what your core values are, it might be helpful to take time to reflect on what is important to you. It might take many moments of reflection over time to clearly identify your core values, so be patient and attentive to what motivates and drives your thoughts and decisions.</p>
                  <p>To get an idea of what your core values might be, consider your answers to the following questions:</p>
                  <pre style="font-size: 20px">
                       What kind of culture do you want to work in?
                       What things, settings or resources are necessary for you to do your best work?
                       What qualities do you feel make strong, healthy relationships?
                       What qualities do you admire most in your role models?
                       What motivates you?
                       What qualities do you wish to develop in yourself professionally and personally?
                       What are your future goals? What qualities will it take to achieve them?</pre>
              </div>
                   
              <div class="row">
                  <h2 class="center" style="margin: 30px 0; color: blue;font-weight: 700; font-size: 25px"> Our Team </h2>
                  <pre style="font-size: 20px">
                            Accenture. 4.1★ 1.5L. Reviews. 76.9T. Salaries. ...
                            Tata Consultancy Services. 3.9★ 1.3L. Reviews. 1.3L. Salaries. ...
                            Capgemini. 4.0★ 69.7T. Reviews. 45.8T. ...
                            Amazon. 4.1★ 1.7L. Reviews. 41.9T. ...
                            Cognizant Technology Solutions. 3.9★ 85.3T. Reviews. 70.7T. ...
                            IBM. 4.2★ 1L. Reviews. 32.7T. ...
                            Oracle. 3.9★ 48.9T. Reviews. 19.1T. ...
                            Cisco Systems. 4.4★ 31.3T. Reviews. 7.8T.
                        </pre>
              </div>    
                    
                    
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
