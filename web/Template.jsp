<%-- 
    Document   : Navigation
    Created on : Nov 3, 2019, 8:54:27 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="stylesheet" href="CSS/Nav.css">
        <link rel="stylesheet" href="CSS/font-awesome/css/font-awesome.min.css">
    </head>

    <body>

        <div class="topnav" id="myTopnav">
            <a id="tit">myBlog.com</a>
            <div id="holder">
                <a href="#news" style="display:none;" >Home</a>
                <a href="Home.jsp" class="active">Home</a>
                   <%
                            String name =(String)session.getAttribute("user"); 
                            if(name != null)
                            {
                              out.print(" <a href='Post.jsp'>Post</a>");
                            }else{
                              out.print("<a title='Cannot access post page login first' style='color:white;cursor:pointer'>Post</a>");
                            }
                              
                    %>
               
                <div class="dropdown">
                    <%
                        if(name != null){
                              String result = name.toUpperCase();
                            char users = result.charAt(0);
                            
                            out.print("<button style='margin-left:16px;background-color: rgba(0, 0, 255, 0.959);' class='dropbtn'>"+users
                                   
                                    + "</button>"
                                    + "<div class='dropdown-content'>"
                                   
                                    + "<a href='Logout.jsp'>  Logout</a>");
                             if(name.equalsIgnoreCase("Admin"))
                             {
                                 out.print("<a href='Admin.jsp'>  Admin</a>");
                             }
                                   
                        }else{
                            out.print("<button class='dropbtn'>Login "
                                    + "<i class='fa fa-caret-down' style='color:white'></i>"
                                    + "</button>"
                                    + "<div class='dropdown-content'>"
                                    + "<a class='fa fa-sign-in' href='Login.jsp'> Login</a>");
                        }

                    %>
                    
                    </div>
                </div> 
                
            </div>
            <a href="javascript:void(0);" style="font-size:25px;" class="icon" onclick="myFunction()">&#9776;</a>
        </div>

        <!--<script src="js/script.js"></script>-->
        <script>
                function myFunction() {
                    var x = document.getElementById("myTopnav");
                    if (x.className === "topnav") {
                        x.className += " responsive";
                    } else {
                        x.className = "topnav";
                    }
                }
        </script>`

    </body>

</html>
