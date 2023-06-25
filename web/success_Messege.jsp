

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
     String message = (String)request.getAttribute("success_message");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">
    </head>
    <body>
        <div class="alert alert-success alert-dismissible fade show" style="text-align: center" role="alert">
            <strong> Success :: </strong> <jsp:expression>message</jsp:expression>
        </div>
    </body>
</html>
