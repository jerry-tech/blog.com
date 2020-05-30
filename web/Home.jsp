<%-- 
    Document   : Home
    Created on : Nov 9, 2019, 8:36:35 PM
    Author     : USER
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>

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
        <link rel="stylesheet" href="CSS/Home.css">
         <link rel="icon" sizes="192x192" href="Images/myBlog.png">
        <title>Home | myBlog.com</title>
    </head>

    <body style="background:whitesmoke;">
        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456" scope="session"/>
        <jsp:include page="Template.jsp"/>
        <jsp:include page="RegNo.jsp"/>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            String Countrow = null;
            String ImgPathSearch = null;
            String likeName = (String) session.getAttribute("user");
            int upVoteCount = 0;
            int downVoteCount = 0;
            ResultSet rs = null;
            String row = null;
            ResultSet setdown = null;
            PreparedStatement psdown;
            int Regno = 0;

        %>

        <div id="body_main">


            <div class="main_post">
                <span id="user" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Search</span>
                <%            try {

                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                        statement = connection.createStatement();

                        String sql = "select postId,Username,posDate,postime,posts from users.Posting";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>

                <div class="body_post">
                    <br>
                    <main class="sub_post">

                        <h3><%=resultSet.getString("Username")%> <span style="float:right"><%=resultSet.getString("posDate")%></span> </h3>

                        <div style="clear:both;line-height: 1.8;font-weight:bold;padding-bottom: 10px;padding-top:10px;">
                            <%=resultSet.getString("Posts")%>

                        </div>
                        <br>
                        <%
                            try {

                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                                String sqlcount = "select count(upVote) from users.upvote where PostId = " + resultSet.getString("postId") + " and upvote = 1";
                                statement = con.createStatement();
                                rs = statement.executeQuery(sqlcount);

                                if (likeName != null) {
                                    Regno = (Integer) session.getAttribute("Regid");
                                }

                                String strQuery = "SELECT COUNT(*) FROM users.upvote where regno = ? and PostId = ? ";
                                PreparedStatement ps = con.prepareStatement(strQuery);
                                ps.setInt(1, Regno);
                                ps.setString(2, resultSet.getString("postId"));

                                String strDownVote = "SELECT COUNT(*) FROM users.downVote where regno = ? and PostId = ? ";
                                psdown = con.prepareStatement(strDownVote);
                                psdown.setInt(1, Regno);
                                psdown.setString(2, resultSet.getString("postId"));

                                setdown = psdown.executeQuery();
                                setdown.next();
                                row = setdown.getString(1);
//                                out.print(psdown);

                                ResultSet set = ps.executeQuery();
                                set.next();
                                Countrow = set.getString(1);


                        %>
                        <aside style="display: flex;align-items: baseline;padding:10px;flex-wrap: wrap">
                            <%                                    while (rs.next()) {

                                        if (likeName != null) {
                                            if (Countrow.equals("0") && row.equals("0")) {
                                                out.print("<form method='post' action='Upvote.jsp'>"
                                                        + "<input type='hidden' name='voteup' value='1'/>"
                                                        + "<input type='hidden' name='postid' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='regno' value=" + (Integer) session.getAttribute("Regid") + ">");
                                                upVoteCount = rs.getInt(1);

                                                out.print("<input style='border:none;color:green;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Likes'/><span style='padding-right: 8px;font-size:15px;color:green; background:none;'>  " + upVoteCount + " .</span>"
                                                        + "</form>");
                                            } else if (row.equals("1") && Countrow.equals("0")) {

                                                upVoteCount = rs.getInt(1);
                                                out.print("<form method='post' action='DelDownUp.jsp'>"
                                                        + "<input type='hidden' name='voteup' value='1'/>"
                                                        + "<input type='hidden' name='postidel' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='postid' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='regno' value=" + (Integer) session.getAttribute("Regid") + ">");
                                                out.print("<input style='border:none;color:green;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Likes'/><span style='padding-right: 8px;font-size:15px;color:green; background:none;'>  " + upVoteCount + " .</span>");

                                                out.print("</form>");
                                            } else if (row.equals("0") && Countrow.equals("1")) {
                                                out.print("<form method='post' action='DeleteVote.jsp'>"
                                                        + "<input type='hidden' name='postidel' value=" + resultSet.getString("postId") + ">"
                                                );
                                                upVoteCount = rs.getInt(1);

                                                out.print("<input style='border:none;color:green;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Likes'/><span style='padding-right: 8px;font-size:15px;color:green; background:none;'>  " + upVoteCount + " .</span>"
                                                        + "</form>");
                                            }
                                        } else {
                                            out.print("<form>");
                                            upVoteCount = rs.getInt(1);

                                            out.print("<input title='Login First To Like a Post' style='border:none;color:green;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Likes'/><span style='padding-right: 8px;font-size:15px;color:green; background:none;'>  " + upVoteCount + " .</span>"
                                                    + "</form>");
                                        }
                                    }

                                    con.close();
                                } catch (Exception e) {

                                }

                            %>        


                            <%                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                                    String sqlcountdown = "select count(downvote) from users.downVote where PostId = " + resultSet.getString("postId") + " and downvote = 1";
                                    statement = con.createStatement();
                                    rs = statement.executeQuery(sqlcountdown);

                                    while (rs.next()) {

                                        if (likeName != null) {
                                            if (Countrow.equals("0") && row.equals("0")) {
                                                out.print(""
                                                        + "<form method='post' action='downVote.jsp'>"
                                                        + "<input type='hidden' name='downvote' value='1'/>"
                                                        + "<input type='hidden' name='postids' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='regno' value=" + (Integer) session.getAttribute("Regid") + ">");

                                                downVoteCount = rs.getInt(1);
                                                out.print("<input style='border:none;color:red;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Dislikes'/><span style='padding-right: 8px;font-size:15px;color:red; background:none;'> " + downVoteCount + " .</span>"
                                                        + "</form>");
                                            } else if (row.equals("1") && Countrow.equals("0")) {
                                                out.print("<form method='post' action='DeleteDownVote.jsp'>"
                                                        + "<input type='hidden' name='postidel' value=" + resultSet.getString("postId") + ">"
                                                );
                                                downVoteCount = rs.getInt(1);

                                                out.print("<input style='border:none;color:red;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='DisLikes'/><span style='padding-right: 8px;font-size:15px;color:green; background:none;'>  " + downVoteCount + " .</span>"
                                                        + "</form>");
                                            } else if (row.equals("0") && Countrow.equals("1")) {

                                                downVoteCount = rs.getInt(1);
                                                out.print("<form method='post' action='DelUpdate.jsp'>"
                                                        + "<input type='hidden' name='voteup' value='1'/>"
                                                        + "<input type='hidden' name='postidel' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='postid' value=" + resultSet.getString("postId") + ">"
                                                        + "<input type='hidden' name='regno' value=" + (Integer) session.getAttribute("Regid") + ">");
                                                out.print("<input style='border:none;color:red;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='DisLikes'/><span style='padding-right: 8px;font-size:15px;color:red; background:none;'>  " + downVoteCount + " .</span>");

                                                out.print("</form>");
                                            }
                                        } else {
                                            out.print("<form>");
                                            downVoteCount = rs.getInt(1);

                                            out.print("<input title='Login First To Dislike a Post' style='border:none;color:red;text-decoration: underline;cursor:pointer;font-size:15px; background:none;' type='submit' Value='Dislikes'/><span style='padding-right: 8px;font-size:15px;color:red ;background:none;'>  " + downVoteCount + " .</span>"
                                                    + "</form>");
                                        }

                                    }
                                    con.close();
                                } catch (Exception e) {

                                }
                                if (likeName != null) {
                            %>  

                            <form action="Comment.jsp" method="post">
                                <input type="hidden" name="post" value="<%=resultSet.getString("postId")%>">
                                <input type="submit" title="Login First To Comment on a Post" style="background:none;border:none;font-size:15px; text-decoration: underline;cursor: pointer ;color:rgba(23, 54, 230, 0.795);" value="Comment">


                            </form>
                            <%
                                } else {

                                    out.print("<form action='Comment.jsp' method='post'>"
                                            + "<input type='text' style='display:none;' name='post' value=" + resultSet.getString("postId") + ">"
                                            + "<input type='submit' title='Login First To Comment on a Post' style='border:none;font-size:15px; text-decoration: underline;cursor: pointer ;color:rgba(23, 54, 230, 0.795); background:none;' value='Comment'>"
                                            + "</form>");
                                }

                            %>     

                         

                                <%                             
                                    String name = resultSet.getString("Username");
                                    String username = (String) session.getAttribute("user");
                                    String post = resultSet.getString("Posts");
                                    String id = resultSet.getString("postId");

                                    if (name.equalsIgnoreCase(username)) {
                                        out.print("<form action='Edit.jsp' method='post'id='updatepost'>"
                                                + "<textarea name='post' Style='display:none'>" + post + "</textarea>"
                                                + "<input type='text' name='code' Style='display:none' value=" + id + ">"
                                                + "<span>. </span><input style='border:none;font-size:15px; text-decoration: underline;cursor: pointer;color:blue; background:none;'  type='submit' value='Update'/><span> .</span>"
                                                + "</form>");
                                        out.print("<form action='Delete' method='post' >"
                                                + "<input type='text' name='postid' Style='display:none' value=" + id + ">"
                                                + "<input style='border:none;font-size:15px; text-decoration: underline;cursor: pointer;color:red; background:none;' type='submit' value='Delete'/>"
                                                + "</form>");
                                    }
                                %>


                                
                                </main>
                                <br>
                </div>
                        </aside>


                        <%
                                }
                                connection.close();

                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                        %> 
                </div>
                <br>

                <aside id="side_nav">

                    <div id="table_items">
                        <h3 style="text-align: center;margin-left: -35px;">Search Users Profile</h3>
                        <form action="Home.jsp" style="margin:auto;width:95%;" method="post">
                            <input type='text' style="width:100%;padding:10px;" name="search" placeholder="Search ..."><br>
                            <button type="submit"  id="search">Search</button>
                        </form>
                        <br><br>

                        <div id="userdetails">
                            <div id="good">
                                <%                                    String name = request.getParameter("search");

                                    if (name != null) {

                                        try {

                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                            connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

                                            String strQuery = "SELECT InfoImg FROM users.userimg where Username = ?";
                                            PreparedStatement ps = connection.prepareStatement(strQuery);
                                            ps.setString(1, name);

                                            ResultSet set = ps.executeQuery();

                                            if (set.next()) {

                                                ImgPathSearch = set.getString("InfoImg");

                                                if (name != null) {

                                                    out.print("<br>"
                                                            + "<form id='searchimg'><img id='imag' title=" + name + " src=" + ImgPathSearch + " alt='No Image'/>");
                                                    out.print("<br>"
                                                            + "</form>"
                                                            + "<br>"
                                                            + "<br>"
                                                            + "<br>"
                                                            + "<div id='heading1'>"
                                                            + "<ul id='heading'>"
                                                            + "<li>Name:</li>"
                                                            + "<li>Username:</li>"
                                                            + "<li>Gender:</li>"
                                                            + "<li>Email:</li>"
                                                            + "</ul>"
                                                            + "");
                                                }

                                            } else {
                                                out.print("<br><h4 style='color: black'>Username does not Exist</h4>");
                                            }
                                        } catch (Exception e) {

                                        }

                                    } else {

                                    }
                                %>


                                <ul id="active">

                                    <%
                                        if (name != null) {
                                            try {

                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                                                statement = connection.createStatement();

                                                String sql = "select firstname,lastname,Username,Gender,emailAddress from users.Register where Username = '" + name + "'";
                                                resultSet = statement.executeQuery(sql);

                                                String strQuery = "SELECT InfoImg FROM users.userimg where Username = ?";
                                                PreparedStatement ps = connection.prepareStatement(strQuery);
                                                ps.setString(1, name);

                                                ResultSet set = ps.executeQuery();

                                                while (resultSet.next()) {
                                    %>
                                    <li><%=resultSet.getString("firstname")%>-<%=resultSet.getString("lastname")%> </li>
                                    <li><%=resultSet.getString("Username")%></li>
                                    <li><%=resultSet.getString("Gender")%></li>
                                    <li><%=resultSet.getString("emailAddress")%></li>

                                    <%
                                                }
                                                connection.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        } else {
//                                            out.print("<p>No Record</p>");
                                        }
                                    %> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>  
            </div>
        </div>


        <script src="js/index.js"></script>


        <jsp:include page="Footer.jsp"/>
        <script>
                    // Get the modal
                    var modal = document.getElementById('side_nav');

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.width = "0%";
                        }
                    }

                    function openNav() {
                        document.getElementById("side_nav").style.width = "100%";
                    }

                    function closeNav() {
                        document.getElementById("side_nav").style.width = "0%";
                    }
        </script> 
        
        <script src="script.js"></script>
    </body>

</html>
