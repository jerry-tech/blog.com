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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author USER
 */
public class Users extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String Fname = request.getParameter("fname");
        String Lname = request.getParameter("lname");
        String Uname = request.getParameter("uname");
        String age = request.getParameter("uage");
        String gender = request.getParameter("ugend");
        String phone = request.getParameter("uphone");
        String email = request.getParameter("uemail");
        String pass = request.getParameter("upass");
        String date = request.getParameter("udate");
        String time = request.getParameter("utime");
        
        String conpass = request.getParameter("ucompass");
         try 
            {

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

               Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
                
               PreparedStatement ps = con.prepareStatement("insert into users.Register values(?,?,?,?,?,?,?,?,?,?)");
               
               ps.setString(1,Fname);
               ps.setString(2,Lname);
               ps.setString(3,Uname);
               ps.setString(4,age);
               ps.setString(5,gender);
               ps.setString(6,phone);
               ps.setString(7,email);
               ps.setString(8,pass);
               ps.setString(9,date);
               ps.setString(10,time);
               
//               logic for checking if username already  exists
              Statement st=con.createStatement();
              String strQuery = "SELECT COUNT(*) FROM users.Register where Username='"+Uname+"'";
                
              ResultSet rs = st.executeQuery(strQuery);
                  rs.next();
                String Countrow = rs.getString(1); 
                if(Countrow.equals("0"))
                {
                   if(pass.contentEquals(conpass)){
                       ps.executeUpdate();
                    response.sendRedirect("Login.jsp");
                   }else{
                       out.print("<p style='color:red'>Password and Confirm Password must be the same</p>");
                       request.getRequestDispatcher("Register.jsp").include(request, response);
                   }
                    
                }else{
                  
                    out.print("<p style='color:red;font-weight:bold;'>Sorry Username already exit or fill in other details properly</p>");
                     request.getRequestDispatcher("Register.jsp").include(request, response);
                }

               
            } 
            catch (ClassNotFoundException | SQLException e) 
            {
                    out.print("<p style='color:red'>Please fill in details properly</p>" + e);
                    request.getRequestDispatcher("Register.jsp").include(request, response);
            }
         out.close();
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold> 

}