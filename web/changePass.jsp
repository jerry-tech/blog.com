<%-- 
    Document   : changePass
    Created on : Nov 28, 2019, 12:57:00 AM
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="Description" content="A blog website.">
        <link rel="manifest" href="manifest.json">
        <meta name="theme-color" content="#000"/>
        <link rel="apple-touch-icon" href="Images/myBlog.png">
        <link rel="icon" sizes="192x192" href="Images/myBlog.png">
        <link rel="stylesheet" type="text/css" media="screen" href="CSS/Change.css">
        <title>Change Password</title>
    </head>
    <body>
        <div id="id01" class="modal">

            <form class="modal-content animate" action="Process.jsp" method="post">
                <div class="imgcontainer">
                    <h1><i>myBlog.com</i></h1>
                </div>

                <div class="container">
                   
<!--                        <label><b>Username</b></label><br>
                        <input type="text" placeholder="Enter Username" name="user"  value=' Disabled>
                        <br>-->
                        <label for="psw"><b>password</b></label><br>
                        <input type="password" placeholder="Enter Old Password" name="pass" required>
                        <br>
                        <label><b>New Password</b></label>
                        <input type="password" placeholder="Enter New Password" name="newpass" required>
                        <br>
                        <label><b>Confirm New Password</b></label>
                        <input type="password" placeholder="Confirm New Password" name="conpass" required>

                        <br> 
                        <button id="submit" type="submit">Submit</button>
                        <br>
                        <br>
                    
                </div>


            </form>
        </div>

    </body>
</html>
