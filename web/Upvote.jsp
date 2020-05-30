<%@page import="java.sql.*"%>
<%
 String votes = request.getParameter("voteup");
 String username = (String)session.getAttribute("user");
 String postid = request.getParameter("postid");
 String regno = request.getParameter("regno");

      
       try{

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

           Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

           PreparedStatement ps = con.prepareStatement("insert into users.upvote values(?,?,?,?)");

           ps.setString(1,votes);
           ps.setString(2,username);
           ps.setString(3, regno);
           ps.setString(4,postid);
           
           
           
           ps.executeUpdate();
           response.sendRedirect("Home.jsp");
       }catch(Exception e){
           
            out.print("<p style='color:red'>Please fill in details properly</p>" + e);
//                    request.getRequestDispatcher("Home.jsp").include(request, response);
       }
%>