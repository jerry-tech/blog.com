<%-- 
    Document   : otp
    Created on : Nov 28, 2019, 12:29:51 PM
    Author     : USER
--%>
<%
    if ((String) session.getAttribute("user") == null) {
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
        <title>OTP | myBlog.com</title>
    </head>
    <body>
        <div id="id01" class="modal">

            <form class="modal-content animate" action="otpProcess.jsp" method="post">
                <div class="imgcontainer">
                    <h1><i>MyBlog.com</i></h1>
                </div>

                <div class="container">
                    <label for="uname"><b>Enter OTP code</b></label>
                    <input type="text" placeholder="Enter OTP code here" name="otpvalue" required>
                    <br>
                    <button id="submit" type="submit">Finish</button>
                    <br>
                    <br><br>
                </div>


            </form>
        </div>
    </body>
</html>
