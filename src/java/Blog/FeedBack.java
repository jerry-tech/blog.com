/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class FeedBack extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String feedback = request.getParameter("feedback");
        String id = request.getParameter("idd");

        if (feedback != null && user != null) {
            try {

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                try (Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");) {

                    //setting auto commit false for concurrency which is true by default
                    con.setAutoCommit(false);

                    try (PreparedStatement ps = con.prepareStatement("insert into users.Feedback values(?,?,?,?)");) {
                        ps.setString(1, email);
                        ps.setString(2, user);
                        ps.setString(3, feedback);
                        ps.setString(4, id);

                        int feed = ps.executeUpdate();
                        if (feed > 0) {
                            response.sendRedirect("Home.jsp");
                            con.commit();
                        } else {
                            out.print("<p style='text-align:center;background: #030831;color:red'>Login First Before your Giving Feedback</p>");
                            request.getRequestDispatcher("Home.jsp").include(request, response);
                        }
                    }
                }

            } catch (ClassNotFoundException | SQLException e) {
                out.print("<p style='text-align:center;background: #030831;color:red'>Login First Before your Giving Feedback</p>");
                request.getRequestDispatcher("Home.jsp").include(request, response);
            }
        }else{
             out.print("<p style='text-align:center;background: #030831;color:red'>Please make sure your feedback fields are not Empty</p>");
                request.getRequestDispatcher("Home.jsp").include(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
