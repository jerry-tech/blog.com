<%-- 
    Document   : Post.jsp
    Created on : Nov 11, 2019, 6:56:41 PM
    Author     : USER
--%>
<%
    if ((String) session.getAttribute("user") == null) {
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
        <title>Post | myBlog.com</title>
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

            <%                String filePathImg = null;

            %>
            <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456" scope="session"/>
            <jsp:include page="Template.jsp"/>

            <br>

            <div class="post_main"> 
                <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; View Profile</span>

                <div class="post_info">

                    <div id="mySidenav" class="sidenav">

                        <aside class="subprofile">
                            <a href="javascript:void(0)" title="Close modal" class="closebtn" onclick="closeNav()">&times;</a>

                            <h2>Users Profile</h2><br>
                            <%                                String name = (String) session.getAttribute("user");

                            %>

                            <div class='avatar'>
                                <%                                    if (name != null) {

                                        Connection con = null;

                                        Statement stmt = null;
                                        ResultSet rs = null;
                                        try {
                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                            con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

                                            stmt = con.createStatement();
                                            rs = stmt.executeQuery("select InfoImg from users.userimg where Username ='" + name + "'");
                                            while (rs.next()) {

                                                filePathImg = rs.getString("InfoImg");
//                                                   out.print(filePathImg);
                                            }

                                        } catch (Exception e) {
                                            out.print("Unable to display image");
                                            out.print("Image display error=" + e);

                                        }
                                        out.print("<a style='clear:both' class='images'><img src='" + filePathImg + "' alt='No Profile Picture'/></a> ");

                                    } else {

                                        out.print("<a class='images'><img src='Images/Default.jpg'/></a>");
                                    }
                                %>
                            </div>
                            <form class="imgcont" action="Image" method="post" enctype="multipart/form-data">

                                <sql:query var="regg" dataSource="${db}">select RegistrationId from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                <c:forEach items="${regg.rows}" var="userlogg">
                                    <input type="number" style="display:none;" name="idd" value='<c:out value="${userlogg.RegistrationId}"> </c:out>'/>

                                </c:forEach>
                                <input type="text" style="display:none;" name="fname" value='<%= (String) session.getAttribute("user")%>'/>

                                <%
                                    if (name != null && filePathImg == null) {
                                        out.print("<input type='file' id='image' name='myimg' value='Upload Image'><br>");
                                        out.print("<input style='clear:both; float:right;background-color: rgba(23, 54, 230, 0.795);color: white;padding:5px;'  type='submit' value='Upload Image'/><br><br>");

                                    }

                                %>
                            </form>




                            <form action="userimage" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="username" value='<%= (String) session.getAttribute("user")%>'/>
                                <sql:query var="regg" dataSource="${db}">select RegistrationId from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                <c:forEach items="${regg.rows}" var="userlogg">
                                    <input type="hidden" style="display:none;" name="regnos" value='<c:out value="${userlogg.RegistrationId}"> </c:out>'/>

                                </c:forEach>
                                <%
                                    if (name != null && filePathImg != null) {
                                        out.print("<label style='cursor:pointer;font-weight:bold;border:1px solid black;padding:10px;' for='kk'>Update Profile Picture</label>");
                                        out.print("<input type='file'id='kk'style='display:none'  name='updateImag' value='Upload Image'><br>");
                                        out.print("<input style='margin:20px 0px; padding:5px 5px;background:blue;color:white;border:none' type='submit' value='Update'/>");

                                    } else if (name == null) {
                                        out.print("<p>cannot Upload please login</p>");
                                    }

                                %>

                            </form>


                            <form action="EditInfo.jsp" method="post">  
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
                                        <sql:query var="rs" dataSource="${db}">select RegistrationId,firstname,lastname,phone,Username,age,Gender,emailAddress from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                        <c:forEach items="${rs.rows}" var="user">
                                            <li><c:out value="${user.firstname}"> </c:out>-<c:out value="${user.lastname}"></c:out></li>
                                            <li><c:out value="${user.Username}"> </c:out></li>
                                            <li><c:out value="${user.phone}"></c:out></li> 
                                            <li><c:out value="${user.age}"> </c:out></li>
                                            <li><c:out value="${user.Gender}"> </c:out></li>
                                            <li><c:out value="${user.emailAddress}"> </c:out></li>

                                                <input type="text" name="id" value='<c:out value="${user.RegistrationId}"></c:out>'style="display:none">
                                            <input type='text' name="firstname" value='<c:out value="${user.firstname}"></c:out>' style="display:none">
                                            <input type='text' name="lastname" value='<c:out value="${user.lastname}"></c:out>' style="display:none">
                                            <input type='text' name="username" value='<c:out value="${user.Username}"> </c:out>' style="display:none">
                                            <input type='text' name="phone" value='<c:out value="${user.phone}"></c:out>' style="display:none">
                                            <input type='text' name="age" value='<c:out value="${user.age}"> </c:out>' style="display:none">
                                            <input type='text' name="gender" value='<c:out value="${user.Gender}"> </c:out>' style="display:none">
                                            <input type='text' name="email" value='<c:out value="${user.emailAddress}"> </c:out>' style="display:none"> 
                                        </c:forEach>
                                    </ul>
                                </div>

                                <button id="edit">Edit Info</button>
                            </form> 
                        </aside>
                    </div>

                    <div class="post_sub">

                        <p>Write something about politics, Sports, Entertainment and so much more ......</p>
                        <main class="cont_form">

                            <form id="post_form" action="Post" method="post">
                                <%
                                    long millis = System.currentTimeMillis();
                                    String time = new java.sql.Time(millis).toString();

                                    java.sql.Date date = new java.sql.Date(millis);
                                %>
                                <sql:query var="reg" dataSource="${db}">select RegistrationId from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                                <c:forEach items="${reg.rows}" var="userlog">
                                    <input type="number" id="userspost" name="id" value='<c:out value="${userlog.RegistrationId}"> </c:out>'/>

                                </c:forEach>

                                <input type="text" id="userspost" name="uname" value='<%= (String) session.getAttribute("user")%>'/>
                                <input type="text" id="userspost" name="fin" value='<%=(date)%>'/>
                                <input type="text" id="userspost" name="use" value='<%=(time)%>'/>

                                <textarea name="posts"  id="post_text" required="true"></textarea>
                                <ul id="postopt">
                                    <li><a>Post With:</a></li>
                                    <li><a>File</a></li>
                                    <li><a>Image</a></li>
                                    <li><a>Video & Audio</a></li>
                                    <li><a>Background</a></li>
                                </ul>
                                <br>
                                <input type="submit" value="Post" id="image">
                            </form>
                        </main>
                    </div>                
                </div>

            </div>
            <jsp:include page="Footer.jsp"/>
            <script>
                let openNav = () => {
                    document.getElementById("mySidenav").style.width = "100%";
                };

                let closeNav = () => {
                    document.getElementById("mySidenav").style.width = "0";
                };
            </script>
        </body>
    </html>
</body>
</html>
