<%-- 
    Document   : Post.jsp
    Created on : Apr 11, 2020, 6:56:41 PM
    Author     : Jeremiah
--%>
<%
    if((String) session.getAttribute("user") == null){
        response.sendRedirect("Home.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="Description" content="A blog website.">
        <link rel="manifest" href="manifest.json">
        <meta name="theme-color" content="#000"/>
        <link rel="apple-touch-icon" href="Images/myBlog.png">
        <link rel="icon" sizes="192x192" href="Images/myBlog.png">
        <title>EditPost | myBlog.com</title>
    </head>
    <body>
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <link rel="stylesheet" href="CSS/Post.css">
            <link rel="stylesheet" href="CSS/font-awesome/css/font-awesome.min.css">
            <title>Posts | myBlog.com</title>
        </head>
        <body id="body_main">
               <%
                   Connection connection = null;
                   
                %>
            <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456" scope="session"/>
            <jsp:include page="Template.jsp"/>
            <br>
                
            <div class="post_main"> 
                <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; View Profile</span>
             
                <div class="post_info">
                    
                    <div id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" title="Close modal" class="closebtn" onclick="closeNav()">&times;</a>
                        <aside class="subprofile">
                            
                            
                            <h2>Users Profile</h2>
                            <%
                            
                                String name = (String) session.getAttribute("user");

                                if(name != null)
                                {
                                    out.print("<h3 style='float:right'><span class='fa fa-check-circle' style='color:green;'></span> Hello "+name+" </h3>");
                                }else{
                                    out.print("<h3><span class='fa fa-check-circle' style='red'></span> Hello Please Login</h3>");
                                }
                            %>
                            
                            <div class='avatar'>
                                    <%
                                       if(name != null)
                                       {
                                          
                                           out.print("<a style='clear:both' class='images'><img src='View.jsp' alt='No Profile Picture'/></a> ");
                                       }else{
                                            
                                           out.print("<a class='images'><img src='Images/Default.jpg'/></a>");
                                       }
                                    %>
                            </div>
                            <form class="imgcont" action="Image" method="post">

                                <sql:query var="regg" dataSource="${db}">select RegistrationId from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                <c:forEach items="${regg.rows}" var="userlogg">
                                    <input type="number" style="display:none;" name="idd" value='<c:out value="${userlogg.RegistrationId}"> </c:out>'/>

                                </c:forEach>
                                <input type="text" style="display:none;" name="fname" value='<%= (String) session.getAttribute("user")%>'/>
                                <%
                                    if(name != null)
                                    {
                                        out.print("<input type='file' id='image' name='myimg' value='Upload Image'><br>");
                                        out.print("<input style='clear:both; float:right;background-color: rgba(23, 54, 230, 0.795);color: white;padding:5px;'  type='submit' value='Upload Image'/><br><br>");
                                        
                                    }else{
                                        out.print("<p>cannot Upload please login</p>");
                                    }
                                
                                %>
                               

                                

                            </form>
                            <div id="userinfo">
                                <ul id="legends">

                                    <li>FullName</li>
                                    <li>Username:</li>
                                     <li>Phone:</li>
                                    <li>Age:</li>
                                    <li>Gender:</li>
                                    <li>Email:</li>
                                </ul>
                                <ul id="data">
                                    <sql:query var="rs" dataSource="${db}">select firstname,lastname,phone,Username,age,Gender,emailAddress from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                    <c:forEach items="${rs.rows}" var="user">
                                        <li><c:out value="${user.firstname}"> </c:out>-<c:out value="${user.lastname}"></c:out></li>
                                        <li><c:out value="${user.Username}"> </c:out></li>
                                        <li><c:out value="${user.phone}"></c:out></li> 
                                        <li><c:out value="${user.age}"> </c:out></li>
                                        <li><c:out value="${user.Gender}"> </c:out></li>
                                        <li><c:out value="${user.emailAddress}"> </c:out></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <button id="edit">Edit Info</button>
                        </aside>
                    </div>

                    <div class="post_sub">

                        <p>Write something about politics, Sports, Entertainment and so much more ......</p>
                        <main class="cont_form">

                            <form id="post_form" action="Edit" method="post">
                         
                                <%
                                 String post = request.getParameter("post");
                            
                                 String codeId = request.getParameter("code");
                                 
                                 
                                 out.print("<textarea name='post' id='post_text'>"+post+"</textarea>");
                                 
                                 out.print("<input type='text' style='display:none' value="+codeId+" name='id'");

                                %>
                                
                                
                                <br>
                                <input type="submit" value="Post" id="image">
                            </form>
                                
               
                        </main>
                    </div>                
                </div>

            </div>
            <jsp:include page="Footer.jsp"/>
            <script>
                 let openNav =()=>{
                    document.getElementById("mySidenav").style.width = "100%";
                  };

                  let closeNav=()=>{
                    document.getElementById("mySidenav").style.width = "0";
                  };
            </script>
        </body>
    </html>
</body>
</html>
