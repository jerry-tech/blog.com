<%-- 
    Document   : Register
    Created on : Nov 3, 2019, 8:10:00 PM
    Author     : User
--%>

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


        <div id="cont" class="animate">
            <br>

            <form action="Users" method="post" class="animate">
                <div id="title">
                    <h2>myBlog.com</h2>
                </div>
                <div class="container">
                    <label for="FName"><b>FirstName</b></label><br>
                    <input id="FName" type="text" placeholder="Enter FirstName" name="fname" required><br>

                    <label for="LName"><b>Lastname</b></label><br>
                    <input id="LName" type="text" placeholder="Enter Lastname" name="lname" required><br>

                    <label for="UName"><b>Username</b></label><br>
                    <input id="UName" type="text" placeholder="Enter Username" name="uname" required><br>

                    <label for="UAge"><b>Age</b></label><br>
                    <input id="UAge" type="number" placeholder="Enter Age" name="uage" required>
                    <br>
                    <b>
                        <label style="font-size: 130%;">Gender</label><br><br></b>
                        <input type="radio" name="ugend" value="Male" > <span style="font-size: 17px">Male</span>
                        <input type="radio" name="ugend" value="Female"> <span style="font-size: 17px">Female</span>
                        <input type="radio" name="ugend" value="Others"> <span style="font-size: 17px">Others</span>
                    <br>
                    <br>
                    <label for="phNum"><b>PhoneNumber</b></label><br>
                    <input id="phNum" type="text" placeholder="Enter PhoneNumber" name="uphone" pattern="[0-9]{11}"
                           required><br>
                    <br>
                    <label for="UEmail"><b>EmailAddress</b></label><br>
                    <input id="UEmail" type="email" placeholder="Enter Address" name="uemail"
                           required><br>

                    <label for="UPass"><b>Password</b></label><br>
                    <input id="UPass" type="password" placeholder="Enter Password" name="upass" min="8" required><br>

                    <label for="UCompass"><b>Comfirm Password</b></label><br>
                    <input id="UCompass" type="password" placeholder="Enter Confirm Password" min="8" name="ucompass" required>


                    <%
                        long millis = System.currentTimeMillis();
                        String time = new java.sql.Time(millis).toString();

                        java.sql.Date date = new java.sql.Date(millis);
                    %>

                    <input  type="hidden" placeholder="Enter Username" name="udate" value='<%=(date)%>' required><br>
                    <input type="hidden" placeholder="Enter Username" name="utime" value='<%=(time)%>' required><br>

                    <button id="submit" type="submit" value="register">Login</button>
                    <button id="submit" type="reset">Reset</button>

                    <br><br>
                     <a href="Login.jsp" style="text-align: center;background: none; ">Already have an account ?</a>
                </div>
            </form>

        </div>
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

    </body>

</html>
