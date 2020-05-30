<%
    if((String) session.getAttribute("user") == null){
        response.sendRedirect("Home.jsp");
    }

%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link rel="stylesheet" href="CSS/comment.css">
        <title>Comment | myBlog.com</title>
    </head>

    <body>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456" scope="session"/>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            String kk = null;
            String poster = "1";

            poster = request.getParameter("post");
      
            
            String regno = null;
            regno = (String)session.getAttribute("user");
        %>
       

        <div id="id01" class="modal1">

            <div class="modal-content1 animate" >
                <div class="imgcontainer1">
                    <a href="Home.jsp" class="close"
                       title="Close Modal" style="color:white;font-size: 40px" >&times;</a>

                </div>

                <div class="container1">


                    <div id="postmain1">
                        <%
                            
                            if (poster != null) {

                            try {

                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                            statement = connection.createStatement();

                            String sql = "select Username,posDate,posts,RegistrationId from users.Posting where postId = '" + poster + "'";
                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                        %>
                        <div id="postmain2">
                            <a style="font-weight: bold; font-size: 20px;"><%=resultSet.getString("Username")%></a><a style="float:right"><%=resultSet.getString("posDate")%></a>
                            <p><%=resultSet.getString("posts")%></p>
                        </div>
                        <%
                                    }
                                    connection.close();

                                } catch (Exception e) {
                                    out.print(e);
                                }

                            }

                            out.print("<label><b>Write comment ......</b></label><br>");
                            out.print("<form id='postcom' action='inputComment.jsp' method='post'>");
                            out.print("<input type='text' name='postid' value='" + poster + "' Style='display:none'/>");
                        %>    


                            <%
                                try {

                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                                    statement = connection.createStatement();

                                    String sql = "select RegistrationId from users.Register where Username = '" +regno+ "'";
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <input type='text' name='register' value='<%=resultSet.getString("RegistrationId")%>' Style="display:none"/>

                            <%
                             
                                    }
                                    connection.close();

                                } catch (Exception e) {
                                    out.print(e);
                                }

                            %>



                            <input type="text" style="width:80%;padding-left: 10px" placeholder="Enter comments" name="comment">
                            <input type="text" name="username" value="<%=(String) session.getAttribute("user")%>" Style="display:none" required/>

                            <br>
                            <button type="submit" style="width:100px">Comment</button>
                        </form>
                        
                        <div class="commentinf">
                            <%

                                try {

                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                                    statement = connection.createStatement();

                                    String sql = "select Username,comments from users.comment where postId = '" + poster + "'";
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <aside id="comment2">
                                <figcaption><b><%=resultSet.getString("Username")%></b></figcaption>
                                <p><%=resultSet.getString("comments")%></p>
                                
                            </aside>  
                            <br> 
                            <%
                                    }
                                    connection.close();

                                } catch (Exception e) {

                                }

                            %>
                        </div>
                    </div>


                </div>
            </div>



            <script>
                // Get the modal
                -- > var modal = document.getElementById('id01');
                        // When the user clicks anywhere outside of the modal, close it
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = " none";
                            }
                        }</script>
    </body>

</body>


</html>