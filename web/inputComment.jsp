<%-- 
    Document   : inputComment
    Created on : Dec 3, 2019, 8:35:11 PM
    Author     : USER
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     
         <%
             String user = request.getParameter("username");
             String comment = request.getParameter("comment");
             String postid = request.getParameter("postid");
             String register = request.getParameter("register");
         
             try
             {
                 
                 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                 
                 Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                 
                 PreparedStatement ps = con.prepareStatement("insert into users.Comment values(?,?,?,?)");
                 
                 ps.setString(1,user);
                 ps.setString(2,comment);
                 ps.setString(3,postid);
                 ps.setString(4,register);
                
                 int i = ps.executeUpdate();
                 
                 if (i>0)
                 {
                     response.sendRedirect("Home.jsp");
                     
                 }
                 else{
                     out.print("Make sure the comment textfield is not empty or check if you've logged in");
                     response.sendRedirect("Comments.jsp");
                 }
                 
             }
             catch (SQLException e)
             {
                 
                 out.print("<p style='color:red'>Make sure the comment textfield is not empty or check if you've logged in");
                 request.getRequestDispatcher("Comment.jsp").include(request, response);
             }
               
         %>   

