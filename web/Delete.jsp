<%-- 
    Document   : Delete
    Created on : Dec 22, 2019, 3:59:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <%--<jsp:include page="Admin.jsp"/>--%>

        <%
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;
        %>  

        <%
            String registration = request.getParameter("register");

            String registrationname = request.getParameter("registername");

            String comments = request.getParameter("comment");

            String commentsname = request.getParameter("commentname");

            String posts = request.getParameter("post");

            String postsname = request.getParameter("postname");

            String Images = request.getParameter("image");

            String Imagesname = request.getParameter("imagename");

            String Feedback = request.getParameter("feedback");

            String Feedname = request.getParameter("feedname");
            


        %>

        <%            try {

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                if (registrationname != null && registration != null) {
                    if (registrationname.equals("Register")) {
                        String str = "DELETE FROM users." + registrationname + " WHERE RegistrationId= ? ";
                        PreparedStatement ps = connection.prepareStatement(str);
                        ps.setString(1, registration);
                        int rs = ps.executeUpdate();

                        if (rs > 0) {
                           String value = "A Record From Registration Table Has Been Deleted Successfully";
                           session.setAttribute("response", value);
                           response.sendRedirect("Admin.jsp");
                        }
                    }
                }
                if (commentsname != null && comments != null) {

                    if (commentsname.equals("comment")) {
                        String str = "DELETE FROM users." + commentsname + " WHERE commentId= ? ";
                        PreparedStatement ps = connection.prepareStatement(str);
                        ps.setString(1, comments);
                        int rs = ps.executeUpdate();

                        if (rs > 0) {
                            String value = "A Record From Comment Table Has Been Deleted Successfully";
                           session.setAttribute("response", value);
                           response.sendRedirect("Admin.jsp");
                        }
                    }
                }
                if (postsname != null && posts != null) {

                    if (postsname.equals("posting")) {
                        String str = "DELETE FROM users." + postsname + " WHERE postId= ? ";
                        PreparedStatement ps = connection.prepareStatement(str);
                        ps.setString(1, posts);
                        int rs = ps.executeUpdate();

                        if (rs > 0) {
                            String value = "A Record From Post Table Has Been Deleted Successfully";
                           session.setAttribute("response", value);
                           response.sendRedirect("Admin.jsp");
                        }
                    }
                }

                if (Imagesname != null && Images != null) {
                    if (Imagesname.equals("userimg")) {
                        String str = "DELETE FROM users." + Imagesname + " WHERE imgId= ? ";
                        PreparedStatement ps = connection.prepareStatement(str);
                        ps.setString(1, Images);
                        int rs = ps.executeUpdate();

                        if (rs > 0) {
                            String value = "A Record From Image Table Has Been Deleted Successfully";
                           session.setAttribute("response", value);
                           response.sendRedirect("Admin.jsp");
                        }
                    }
                }

                if (Feedname != null && Feedback != null) {
                    if (Feedname.equals("feedback")) {
                        String str = "DELETE FROM users." + Feedname + " WHERE feedbackId= ? ";
                        PreparedStatement ps = connection.prepareStatement(str);
                        ps.setString(1, Feedback);
                        int rs = ps.executeUpdate();

                        if (rs > 0) {
                            String value = "A Record From Feedback Table Has Been Deleted Successfully";
                           session.setAttribute("response", value);
                           response.sendRedirect("Admin.jsp");
                        }
                    }
                }

            } catch (Exception e) {
                out.print(e);
            }

        %>
        <jsp:include page="Admin.jsp"/>
    </body>
</html>
