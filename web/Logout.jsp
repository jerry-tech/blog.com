<%-- 
    Document   : Logout.jsp
    Created on : Nov 18, 2019, 1:41:44 PM
    Author     : USER
--%>
<%
    if((String) session.getAttribute("user") == null){
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
       <% 
           
           session.invalidate();
           request.getRequestDispatcher("Home.jsp").include(request, response);

       %>
    </body>
</html>
