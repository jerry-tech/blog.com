<%-- 
    Document   : Validation
    Created on : Nov 12, 2019, 3:49:32 PM
    Author     : USER
--%>

        <%@page import="java.sql.*"%>
      <%
           try 
            {

            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
            PreparedStatement ps = con.prepareStatement("select Username,Password from users.Register where Username=? and Password=?");
               
               ps.setString(1, user);
               ps.setString(2, pass);
              
               ResultSet rs = ps.executeQuery();
               if(rs.next())
               {
                       
                    String name = request.getParameter("username");

                    session.setAttribute("user",name);
//              
//                   request.getRequestDispatcher("Home.jsp").forward(request, response);
                    response.sendRedirect("Home.jsp");
                   
               }
               else{
                   out.print("<h3 style='color:red'>Please insert the correct username and password </h3>");
                    request.getRequestDispatcher("Login.jsp").include(request, response);
               }
               
            } 
            catch (Exception e) 
            {
                 out.print("Please specify a correct username and password"+e);
            }
      %>
         
    
