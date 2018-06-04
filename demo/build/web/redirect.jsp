<%-- 
    Document   : redirect
    Created on : May 20, 2018, 8:46:29 PM
    Author     : Visible
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% response.sendRedirect("Home/redirectPage.htm?page=index");%>
    </body>
</html>
