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
public class Edit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        PrintWriter out = response.getWriter();
        String post = request.getParameter("post");
                            
        String codeId = request.getParameter("id");
        
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

            String str = "UPDATE users.POSTING SET posts= ? WHERE postId= ? "; 
            PreparedStatement ps = connection.prepareStatement(str);
            ps.setString(1, post);
            ps.setString(2, codeId);
            int rs = ps.executeUpdate();
            if(rs>0){
                response.sendRedirect("Home.jsp");
            }

         }catch(Exception e)
        {
            out.print(e);
        }
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
