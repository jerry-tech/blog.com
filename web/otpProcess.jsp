<%-- 
    Document   : otpProcess
    Created on : Apr 28, 2019, 12:38:26 PM
    Author     : Hp
--%>
<%
    if((String) session.getAttribute("user") == null){
        response.sendRedirect("Home.jsp");
    }

%>

<%@page import="java.sql.*"%>

<%

    String user = null;
    
    user = (String) session.getAttribute("user");

   
//-----------------------------------------------------------------------------   
    String change = (String) session.getAttribute("change");

    int otp = (Integer) session.getAttribute("otp");
    String otpvalue = request.getParameter("otpvalue");
    
    int enterOtp = Integer.parseInt(otpvalue);
    if (otp == enterOtp) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
            PreparedStatement pz = con.prepareStatement("update users.Register set Password = ? where Username = '" + user + "' ");
           
            pz.setString(1, change);

            pz.executeUpdate();
            out.print("<p style='text-align:center;color:white'>Password Changed successfully.!</p>");
            request.getRequestDispatcher("Home.jsp").include(request, response);
        } catch (Exception e) {
            out.print("<p style='text-align:center;color:red; text-size:20px;'>Password Update Failed.!</p>");
            request.getRequestDispatcher("otp.jsp").include(request, response);
            e.printStackTrace();
        }
    } else {
        out.print("OTP not matched try again");
        
         out.print("<p style='text-align:center;color:red; text-size:20px;'>OTP not matched try again !</p>");
            request.getRequestDispatcher("otp.jsp").include(request, response);
    }


%>
