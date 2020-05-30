<%-- 
    Document   : Register
    Created on : Nov 3, 2019, 8:10:00 PM
    Author     : Jeremiah
--%>
<%
    if ((String) session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="Description" content="A blog website.">
        <link rel="manifest" href="manifest.json">
        <meta name="theme-color" content="#000"/>
        <link rel="apple-touch-icon" href="Images/myBlog.png">
        <link rel="icon" sizes="192x192" href="Images/myBlog.png">
        <title>Register | myBlog.com</title>
        <link rel="stylesheet" href="CSS/Register.css">
    </head>

    <body style="background:black">



        <div id="contright">
            <main id="element">
                <p>my</p>
                <p><i>B</i></p>
                <p><i>l</i></p>
                <p><i>o</i></p>
                <p><i>g</i></p>
                <p><i>.</i></p>
                <p><i>c</i></p>
                <p><i>o</i></p>
                <p><i>m</i></p>
                <br>

            </main>
        </div>
        <div id="cont" class="animate">
            <br>

            <form action="Editinfo" method="post" class="animate">
                <div id="title">
                    <h2>myBlog.com</h2>
                </div>
                <div class="container">
                    <%                    String id = request.getParameter("id");
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String username = request.getParameter("username");
                        String phone = request.getParameter("phone");
                        String age = request.getParameter("age");
                        String gender = request.getParameter("gender");
                        String email = request.getParameter("email");
                    %>

                    <%
                        out.print("<input type='text' style='display:none' value=" + id + " name='id'>");
                        out.print("<label for='FName'><b>FirstName</b></label><br>"
                                + "<input type='text' value=" + firstname + " name='fname' required><br>"
                                + " <label for='LName'><b>Lastname</b></label><br>"
                                + "<input type='text' value=" + lastname + " name='lname' required><br>"
                                + "<label for='UName'><b>Username</b></label><br>"
                                + "<input type='text' value=" + username + " name='uname' required><br>"
                                + "<label for='UAge'><b>Age</b></label><br>"
                                + "<input type='number' value=" + age + " name='uage' required><br>"
                                + "");
                        if (gender.equalsIgnoreCase("male")) {
                            out.print("<b><label style='font-size: 130%;'>Gender</label><br><br></b>"
                                    + "<input type='radio' name='ugend' value='male' checked> <span style='font-size: 17px'>Male </span>"
                                    + "<input type='radio' name='ugend' value='Female'> <span style='font-size: 17px'>Female </span>"
                                    + "<input type='radio' name='ugend' value='Others'> <span style='font-size: 17px'>Others </span><br>"
                                    + "<br>");
                        } else if (gender.equalsIgnoreCase("female")) {
                            out.print("<b><label style='font-size: 130%;'>Gender</label><br><br></b>"
                                    + "<input type='radio' name='ugend' value='male'> <span style='font-size: 17px'>Male </span>"
                                    + "<input type='radio' name='ugend' value='female' checked> <span style='font-size: 17px'>Female </span>"
                                    + "<input type='radio' name='ugend' value='Others'> <span style='font-size: 17px'>Others </span><br>"
                                    + "<br>");
                        } else if (gender.equalsIgnoreCase("others")) {
                            out.print("<b><label style='font-size: 130%;'>Gender</label><br></br></b>"
                                    + "<input type='radio' name='ugend' value='male'>  <span style='font-size: 17px'>Male </span>"
                                    + "<input type='radio' name='ugend' value='female'>  <span style='font-size: 17px'>Female </span>"
                                    + "<input type='radio' name='ugend' value='Others' checked>  <span style='font-size: 17px'>Others </span><br>"
                                    + "<br>");
                        }
                        out.print(" <br> <label><b>PhoneNumber</b></label><br>"
                                + "<input type='text' value=" + phone + " name='uphone' pattern='[0-9]{11}' required><br>"
                                + "<br>"
                                + "<label for='UEmail'><b>EmailAddress</b></label><br>"
                                + "<input type='email' value=" + email + " name='uemail'required><br>"
                        );
                    %>


                    <button id="submit" type="submit">Update</button>
                    <button id="submit" type="reset">Reset</button>




                </div>
            </form>

        </div>

    </body>

</html>
