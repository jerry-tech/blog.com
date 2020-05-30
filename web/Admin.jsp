<%-- 
    Document   : Select
    Created on : Dec 20, 2019, 2:37:36 PM
    Author     : Jeremiah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <link rel="stylesheet" href="CSS/Admin.css">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="Template.jsp"/>
        <div>
            <%
                String name =(String)session.getAttribute("user"); 
                String getResponse =(String)session.getAttribute("response");
                
                if(name != null && getResponse != null){
                    
            %>
            <div style="width:80%;margin: auto;">
                
                <a style="float:right;opacity: 1;padding: 5px; font-size: 120%; background: red; color:black"  href='DelResponse.jsp'>X</a>
              
                <main id="restzz" style="padding:3%;background: rgba(23, 54, 230, 0.795); ">
                   
                    <div style="text-align: center; font-size: 120%;font-weight: bold; color: rgb(0, 0, 0);"><%=getResponse%></div>
                </main>
            </div>
            <%
                }
            %>

            <div style="overflow-x:auto; padding-top:5%;">

                <jsp:include page="SubAdmin.jsp"/>
                <%
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;
                %>

                <%
                    String table = request.getParameter("tables");
                %>

                <%
                    if (table != null) {

                        if (table.equals("Register")) {

                            out.print("<table id='Records'>"
                                    + "<tr>"
                                    + "<th>RegistrationId</th>"
                                    + " <th>Name</th>"
                                    + "<th>Username</th>"
                                    + "<th>Age</th>"
                                    + "<th>Gender</th>"
                                    + "<th>PhoneNumber</th>"
                                    + "<th>EmailAddress</th>"
                                    + " <th>Update</th>"
                                    + "<th>Delete</th>"
                                    + "</tr>");
                        } else if (table.equals("comment")) {
                            out.print("<table id='Records'>"
                                    + "<tr>"
                                    + "<th>CommentId</th>"
                                    + " <th>Username</th>"
                                    + "<th>Comments</th>"
                                    + "<th>PostId</th>"
                                    + "<th>RegistrationId</th>"
                                    + "<th>Delete</th>"
                                    + "</tr>");
                        } else if (table.equals("posting")) {
                            out.print("<table id='Records'>"
                                    + "<tr>"
                                    + "<th>PostId</th>"
                                    + " <th>Username</th>"
                                    + "<th>Post-Date</th>"
                                    + "<th>Post-Time</th>"
                                    + "<th>Posts</th>"
                                    + "<th>RegistrationId</th>"
                                    + "<th>Delete</th>"
                                    + "</tr>");
                        } else if (table.equals("userimg")) {
                            out.print("<table id='Records'>"
                                    + "<tr>"
                                    + "<th>ImageId</th>"
                                    + " <th>Username</th>"
                                    + "<th>Image-Blob</th>"
                                    + "<th>RegistrationId</th>"
                                    + "<th>Delete</th>"
                                    + "</tr>");
                        } else if (table.equals("feedback")) {
                            out.print("<table id='Records'>"
                                    + "<tr>"
                                    + "<th>feedbackId</th>"
                                    + " <th>Email</th>"
                                    + "<th>UserName</th>"
                                    + "<th>FeedBack</th>"
                                    + "<th>RegistrationId</th>"
                                    + "<th>Delete</th>"
                                    + "</tr>");
                        }
                    } else {
                        out.print("<table id='Records'>"
                                + "<tr>"
                                + "<th>RegistrationId</th>"
                                + " <th>Name</th>"
                                + "<th>Username</th>"
                                + "<th>Age</th>"
                                + "<th>Gender</th>"
                                + "<th>PhoneNumber</th>"
                                + "<th>EmailAddress</th>"
                                + " <th>Update</th>"
                                + "<th>Delete</th>"
                                + "</tr>");
                    }
                %>


                <%     try {

                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                        statement = connection.createStatement();

                        if (table != null) {
                            String sql = "select * from users." + table + " ";
                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                                if (table.equals("Register")) {
                                    out.print("<tr>"
                                            + "<td> " + resultSet.getString("RegistrationId") + " </td>"
                                            + "<td> " + resultSet.getString("lastname") + "-" + resultSet.getString("firstname") + "</td>"
                                            + "<td> " + resultSet.getString("Username") + " </td>"
                                            + "<td> " + resultSet.getString("age") + " </td>"
                                            + "<td> " + resultSet.getString("Gender") + " </td>"
                                            + "<td> " + resultSet.getString("phone") + " </td>"
                                            + "<td> " + resultSet.getString("emailAddress") + " </td>");

//                                    
                                    out.print("<td>"
                                            + "<form id='update' action='EditInfo.jsp' method='post'>"
                                            + "<input type='text' name='id' value=" + resultSet.getString("RegistrationId") + " style='display:none'>"
                                            + "<input type='text' name='firstname' value=" + resultSet.getString("firstname") + " style='display:none'>"
                                            + "<input type='text' name='lastname' value=" + resultSet.getString("lastname") + " style='display:none'>"
                                            + "<input type='text' name='username' value=" + resultSet.getString("Username") + " style='display:none'>"
                                            + "<input type='text' name='phone' value=" + resultSet.getString("phone") + " style='display:none'>"
                                            + "<input type='text' name='age' value=" + resultSet.getString("age") + " style='display:none'>"
                                            + "<input type='text' name='gender' value=" + resultSet.getString("Gender") + " style='display:none'>"
                                            + "<input type='text' name='email' value=" + resultSet.getString("emailAddress") + " style='display:none'> "
                                            + "<input id='updatein' type='submit' value='Update'/>"
                                            + "</form>"
                                            + " </td>"
                                            + "<td>"
                                            + "<form action='Delete.jsp' id='delete'>"
                                            + "<input type='text' style='display:none' name='register' value=" + resultSet.getString("RegistrationId") + ">"
                                            + "<input type='text' style='display:none' name='registername' value='Register'>"
                                            + "<input id='deletein' type='submit' value='Delete'/>"
                                            + "</form>"
                                            + "</td>"
                                            + "</tr>");
                                } else if (table.equals("comment")) {
                                    out.print("<tr>"
                                            + "<td> " + resultSet.getString("commentId") + " </td>"
                                            + "<td> " + resultSet.getString("Username") + " </td>"
                                            + "<td> " + resultSet.getString("comments") + " </td>"
                                            + "<td> " + resultSet.getString("postId") + " </td>"
                                            + "<td> " + resultSet.getString("RegistrationId") + " </td>");

                                    out.print("<td>"
                                            + "<form action='Delete.jsp' id='delete'>"
                                            + "<input type='text'style='display:none' name='comment' value=" + resultSet.getString("commentId") + ">"
                                            + "<input type='text'style='display:none' name='commentname' value='comment'>"
                                            + "<input id='deletein' type='submit' value='Delete'/>"
                                            + "</form>"
                                            + "</td>"
                                            + "</tr>");
                                } else if (table.equals("posting")) {
                                    out.print("<tr>"
                                            + "<td> " + resultSet.getString("postId") + " </td>"
                                            + "<td> " + resultSet.getString("Username") + " </td>"
                                            + "<td> " + resultSet.getString("posDate") + " </td>"
                                            + "<td> " + resultSet.getString("postime") + " </td>"
                                            + "<td> " + resultSet.getString("posts") + " </td>"
                                            + "<td> " + resultSet.getString("RegistrationId") + " </td>");

                                    out.print("<td>"
                                            + "<form action='Delete.jsp' id='delete'>"
                                            + "<input type='text' style='display:none' name='post' value=" + resultSet.getString("postId") + ">"
                                            + "<input type='text' style='display:none' name='postname' value='posting'>"
                                            + "<input id='deletein' type='submit' value='Delete'/>"
                                            + "</form>"
                                            + "</td>"
                                            + "</tr>");
                                } else if (table.equals("userimg")) {
                                    out.print("<tr>"
                                            + "<td> " + resultSet.getString("imgId") + " </td>"
                                            + "<td> " + resultSet.getString("Username") + " </td>"
                                            + "<td> " + resultSet.getString("InfoImg") + " </td>"
                                            + "<td> " + resultSet.getString("RegistrationId") + " </td>");

                                    out.print("<td>"
                                            + "<form action='Delete.jsp' id='delete'>"
                                            + "<input type='text'style='display:none' name='image' value=" + resultSet.getString("imgId") + ">"
                                            + "<input type='text'style='display:none' name='imagename' value='userimg'>"
                                            + "<input id='deletein' type='submit' value='Delete'/>"
                                            + "</form>"
                                            + "</td>"
                                            + "</tr>");
                                } else if (table.equals("feedback")) {
                                    out.print("<tr>"
                                            + "<td> " + resultSet.getString("feedbackId") + " </td>"
                                            + "<td> " + resultSet.getString("email") + " </td>"
                                            + "<td> " + resultSet.getString("username") + " </td>"
                                            + "<td> " + resultSet.getString("feedback") + " </td>"
                                            + "<td> " + resultSet.getString("RegistrationId") + " </td>");

                                    out.print("<td>"
                                            + "<form action='Delete.jsp' id='delete'>"
                                            + "<input type='text'style='display:none' name='feedback' value=" + resultSet.getString("feedbackId") + ">"
                                            + "<input type='text'style='display:none' name='feedname' value='feedback'>"
                                            + "<input id='deletein' type='submit' value='Delete'/>"
                                            + "</form>"
                                            + "</td>"
                                            + "</tr>");
                                }


                %>


                <%                    }

                            connection.close();

                        } else {
                            String sql1 = "select * from users.Register";
                            resultSet = statement.executeQuery(sql1);
                            while (resultSet.next()) {
                                out.print("<tr>"
                                        + "<td> " + resultSet.getString("RegistrationId") + " </td>"
                                        + "<td> " + resultSet.getString("lastname") + "-" + resultSet.getString("firstname") + "</td>"
                                        + "<td> " + resultSet.getString("Username") + " </td>"
                                        + "<td> " + resultSet.getString("age") + " </td>"
                                        + "<td> " + resultSet.getString("Gender") + " </td>"
                                        + "<td> " + resultSet.getString("phone") + " </td>"
                                        + "<td> " + resultSet.getString("emailAddress") + " </td>");
                                out.print("<td>"
                                        + "<form id='update'>"
                                        + "<input id='updatein' type='submit' value='Update'/>"
                                        + "</form>"
                                        + " </td>"
                                        + "<td>"
                                        + "<form id='delete'>"
                                        + "<input id='deletein' type='submit' value='Delete'/>"
                                        + "</form>"
                                        + "</td>"
                                        + "</tr>");
                            }
                            connection.close();

                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                %> 


                </table>
            </div>
            <br>
            <jsp:include page="Footer.jsp"/>   
        </div>
        
        <script>
            
            function controlDis () {
                document.getElementById("restzz").style.display ="none"
            }
            
            </script>
    </body>
</html>
