<%@page import="java.sql.*"%>
<%
    int regId = (Integer) session.getAttribute("Regid");
    String post = request.getParameter("postidel");
    
    String votes = request.getParameter("voteup");
    String username = (String)session.getAttribute("user");
    String postid = request.getParameter("postid");
    String regno = request.getParameter("regno");
            
    try {

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
        String strQueryDel = "Delete FROM users.downVote where regno = ? and PostId = ? ";
        PreparedStatement psdel = con.prepareStatement(strQueryDel);
        psdel.setInt(1, regId);
        psdel.setString(2, post);

       int res =  psdel.executeUpdate();
       if(res > 0){
           String insertQuery = "insert into users.upvote values (?,?,?,?)";
           PreparedStatement ps = con.prepareStatement(insertQuery);
           ps.setString(1, votes);
           ps.setString(2, username);
           ps.setString(3, regno);
           ps.setString(4, postid);
           
           ps.executeUpdate();
           response.sendRedirect("Home.jsp");
       }
    } catch (Exception e) {
//        out.print(e);

    }
%>