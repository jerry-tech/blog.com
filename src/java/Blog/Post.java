/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Blog;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class Post extends HttpServlet {

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try 
            (PrintWriter out = response.getWriter()) {

             String name = request.getParameter("uname");
             String date = request.getParameter("fin");
             String time = request.getParameter("use");
             String post = request.getParameter("posts");
              String regno = request.getParameter("id");
             try
             {
                 
                 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                 
                 Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                 
                 PreparedStatement ps = con.prepareStatement("insert into users.Posting values(?,?,?,?,?)");
                 
                 ps.setString(1,name);
                 ps.setString(2,date);
                 ps.setString(3,time);
                 ps.setString(4,post);
                 ps.setString(5,regno);
                 int i = ps.executeUpdate();
                 
                 if (i>1)
                 {
                     response.sendRedirect("Home.jsp");
                     
                 }
                 else{
                     out.print("<p style='color:red;text-align:center;background: #030831;'>Make sure the post textfield is not empty or check if you've logged in</p>");
                     response.sendRedirect("Post.jsp");
                 }
                 
             }
             catch (ClassNotFoundException | SQLException e)
             {
                 out.print("<p style='color:red;text-align:center;background: #030831;'>Make sure the post textfield is not empty or check if you've logged in</p>");
                 request.getRequestDispatcher("Post.jsp").include(request, response);
             }
               
            } 
       
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
