<%-- 
    Document   : Login
    Created on : Nov 10, 2019, 5:31:55 PM
    Author     : User
--%>

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
        <title>Login | myBlog.com</title>
        <link rel="stylesheet" href="CSS/Nav.css">
    </head>
    <body style="color:white">
        <div id="id01" class="modal" >2

            <form class="modal-content" action="Validation.jsp" method="post">
                <div class="imgcontainer">

                    <h1>My<i style="color:white">Blog.com</i></h1>

                </div>

                <div class="container">
                    <label for="uname"><b>Username </b></label><br>
                    <input type="text" placeholder="Enter Username" name="username" required><br>

                    <label for="psw"><b>Password</b></label><br>
                    <input type="password" placeholder="Enter Password" name="password" required>

                    <button id="submit" type="submit">Login</button>
                    <br>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container" style="background-color:#f1f1f1">
                    <button type="button" style="visibility: hidden"
                            class="cancelbtn">Cancel</button>
                    <span class="psw">Create <a href="Register.jsp" style="color:black; text-decoration: underline;">Account?</a></span>
                </div>
            </form>
        </div>


    </body>
</html>
