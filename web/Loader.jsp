<%-- 
    Document   : Loader
    Created on : Mar 28, 2020, 3:26:53 PM
    Author     : Jeremiah
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/font-awesome/css/font-awesome.min.css"/>
        <title>Loading | myBlog.com</title>

        <style>



            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 24px 0;
                position: relative;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }


            /* The Modal (background) */
            .modal {
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
                font-family: monospace;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 25% auto 25% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 60%; /* Could be more or less, depending on screen size */
            }
            @media screen and (max-width: 600px){
                .modal-content{
                    width:100%;
                    background: whitesmoke;
                    margin: 15% auto 15% auto;
                }
            }
            .buttonload {
                background-color: rgb(8, 27, 133);
                border: none; /* Remove borders */
                color: white; /* White text */
                padding: 12px 16px; /* Some padding */
                font-size: 16px; /* Set a font size */
                box-shadow: 2px 2px 2px black;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }


        </style>
    </head>
    <body>

    </body>
</html>
