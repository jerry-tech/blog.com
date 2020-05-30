<%-- 
    Document   : DelResponse
    Created on : May 29, 2020, 10:40:37 AM
    Author     : Jeremiah
--%>

<%
    if ((String) session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            session.removeAttribute("response");
            response.sendRedirect("Admin.jsp");


        %>
    </body>

</html>