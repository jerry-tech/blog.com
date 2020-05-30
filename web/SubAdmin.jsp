<%-- 
    Document   : Admin
    Created on : Dec 19, 2019, 2:30:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String adminName = (String) session.getAttribute("user");
    if(adminName == null && adminName != "Admin"){
        response.sendRedirect("Home.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/Admin.css">
        <title>JSP Page</title>
    </head>
    <body>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <div>
            <div>
                <form action="Admin.jsp" method="post" id="formselect">
                    <label>Select Table:</label>
                    <select name="tables" id="dropdown">
                        <option value="comment">Comments</option>
                        <option value="posting">Posts</option>
                        <option value="Register" selected="true">Registration</option>
                        <option value="userimg">Users-Image</option>
                        <option value="feedback">FeedBack</option>
                    </select>
                    <button id="selecty" type="submit">Submit</button>
                </form> 
               
            </div>
         
  
        </div>
    </body>
</html>
