/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Blog;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author USER
 */
public class Editinfo extends HttpServlet {

 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String id = request.getParameter("id");
        String Fname = request.getParameter("fname");
        String Lname = request.getParameter("lname");
        String Uname = request.getParameter("uname");
        String age = request.getParameter("uage");
        String gender = request.getParameter("ugend");
        String phone = request.getParameter("uphone");
        String email = request.getParameter("uemail");
        
         try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

            String str = "UPDATE users.Register SET firstname= ?,lastname=?,Username=?,age=?,Gender=?,phone=?,emailAddress=? WHERE RegistrationId= ? "; 
            PreparedStatement ps = connection.prepareStatement(str);
            ps.setString(1, Fname);
            ps.setString(2, Lname);
            ps.setString(3, Uname);
            ps.setString(4, age);
            ps.setString(5, gender);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setString(8, id);
            int rs = ps.executeUpdate();
            if(rs>0){
                response.sendRedirect("Home.jsp");
            }

         }catch(IOException | ClassNotFoundException | SQLException e)
        {
            out.print(e);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
