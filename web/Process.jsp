<%-- 
    Document   : Validation
    Created on : Nov 12, 2019, 3:49:32 PM
    Author     : USER
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Random"%>
<jsp:useBean id="obj" class="Blog.Mailer"/>


<%
    try {

        String email = null;

        String user = (String) session.getAttribute("user");

        String pass = request.getParameter("pass");
        String change = request.getParameter("newpass");
        String confirm = request.getParameter("conpass");

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
        PreparedStatement ps = con.prepareStatement("select Username,Password from users.Register where Username=? and Password=?");

        ps.setString(1, user);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            if (change.equals(confirm)) {

                Statement statement = con.createStatement();
                String sql = "select emailAddress from users.Register where Username = '" + user + "'";
                ResultSet result = statement.executeQuery(sql);
                while (result.next()) {
                    email = result.getString("emailAddress");

                }

                session.setAttribute("change", change);

                Random rand = new Random();
                int otp = rand.nextInt(900000) + 100000;
                session.setAttribute("otp", otp);

                String message = "Your OTP code is " + otp;

                String to = email;
                String from = "//from@gmail.com";
                String password = "//addPassword";
                String subject = "myBlog.com Change Password otp";
                String msg = message;

                boolean check = obj.send(to, from, subject, password, msg);

//                out.close();
//                response.sendRedirect("otp.jsp");
                if (check) {
                    response.sendRedirect("otp.jsp");
                } else {
                    out.print("Could not send OTP");
                    request.getRequestDispatcher("changePass.jsp").include(request, response);
                }

            } else {
                out.print("password and confirm password does not match");
                request.getRequestDispatcher("changePass.jsp").include(request, response);
            }
//-------------------------------------------------------------------------------------           

        } else {
            out.print("<h3 style='color:red'>Please insert the correct username and password </h3>");
            request.getRequestDispatcher("Login.jsp").include(request, response);
        }

    } catch (Exception e) {
        out.print("Please specify a correct username and password" + e);
    }
%>
