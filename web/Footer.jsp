
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    if ((String) session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    }

%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" media="screen" href="CSS/foot.css">
        <link rel="stylesheet" href="CSS/font-awesome/css/font-awesome.min.css">
    </head>

    <body>
        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456" scope="session"/>
        <main id="content">
            <footer class="foot">
                <div class="sub_foot">

                    <div class="block">

                        <ul class="cont_foott">
                            <h3>Options</h3>
                            <a>
                                <li>Posts</li>
                            </a>
                            <a>
                                <li>Privacy</li>
                            </a>
                            <a href="changePass.jsp">
                                <li>Change Password</li>
                            </a>
                        </ul>
                        <figure class="social">
                            <a href="www.facebook.com/" class="fa fa-facebook"></a>
                            <a href="www.twitter.com/" class="fa fa-twitter"></a>
                            <a href="www.instagram.com/" class="fa fa-instagram"> </a>

                        </figure>
                    </div>

                    <div class="cont_foot2">
                        <h3>Terms & Services</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique molestiae harum repellat,
                            perferendis numquam, voluptas vel quam deserunt eveniet nostrum alias ex dolorum. Maxime
                            asperiores
                            earum quas molestias officia dolore!
                        </p>
                    </div>
                    <aside class="cont-foot3">

                        <form action="FeedBack" method="post" class="form">
                            <h3 style="text-indent: 0px">Feedback Mechanism</h3>
                            <label><b>EmailAddress</b></label>
                            <br>
                            <input type="text" required placeholder="Enter EmailAddress" name="email">
                            <br>

                            <sql:query var="regg" dataSource="${db}">select RegistrationId from users.Register where Username='<%= (String) session.getAttribute("user")%>'</sql:query>

                            <c:forEach items="${regg.rows}" var="userlogg">
                                <input type="number" style="display:none;" name="idd" value='<c:out value="${userlogg.RegistrationId}"> </c:out>'/>

                            </c:forEach>

                            <input type="hidden" name="user" value="<%= (String) session.getAttribute("user")%>"/>

                            <label><b>Feedback</b></label><br>
                            <textarea id="text" name="feedback" required placeholder="Enter your feedback here !"></textarea>
                            <%
                                if ((String) session.getAttribute("user") != null) {
                            %>
                            <button id="submit">Submit</button>

                            <%
                            } else {
                            %>
                            <br> <br>

                            <a id="submit" style="width:40%;" onclick='document.getElementById("id01").style.display = "block"'>Submit</a>


                            <%
                                }
                            %>

                            <div id="id01" class="modal">

                                <div class="modal-content ">
                                    <div class="imgcontainer">
                                        <button class="buttonload">
                                            <i class="fa fa-spinner fa-spin"></i> <span style="font-family:monospace">Please Login Before Giving A FeedBack</span>
                                        </button>

                                        <div style="margin: auto;padding-top: 20px;width:28%;">
                                            <a id="submit" href="Login.jsp"title="Click here to Login">Login</a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </form>
                    </aside>

                </div>
                <br>
                <a href="#body_main" ><div class="top">Back to top</div></a>
                <br>
                <div class="copy"> 
                    <figcaption><%=new java.util.Date()%></figcaption>

                    <p>Copyright &copy 2019-All rights reserved</p>

                </div>
            </footer>

        </main>


        <jsp:include page="Loader.jsp"/>
        <script>

            // Get the modal
            var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
    </body>

</html>
