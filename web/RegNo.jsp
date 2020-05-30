<%@page import="java.sql.*"%>
<%
    String name = (String)session.getAttribute("user");

    if(name != null){
       try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

           Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
            String sql = "select RegistrationId from users.Register where Username = '"+name+"'";
         
           Statement stm = con.createStatement();
          ResultSet rs = stm.executeQuery(sql);  
           while(rs.next()){ 
               int username= rs.getInt("RegistrationId");
               session.setAttribute("Regid",username);
             
           }
       }catch(Exception e){
//           out.print(e);
       }   

    }
%>