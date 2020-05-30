<%@page import="java.sql.*"%>
<%
    int regId = (Integer) session.getAttribute("Regid");
    String post = request.getParameter("postidel");
    try {

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
        String strQueryDel = "Delete FROM users.downVote where regno = ? and PostId = ? ";
        PreparedStatement psdel = con.prepareStatement(strQueryDel);
        psdel.setInt(1, regId);
        psdel.setString(2, post);

       int res =  psdel.executeUpdate();
       if(res > 0){
           response.sendRedirect("Home.jsp");
       }
    } catch (Exception e) {
//        out.print(e);

    }
%>