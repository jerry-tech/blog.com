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
public class Delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          PrintWriter out = response.getWriter();
          
        String id = request.getParameter("postid");   
        
        
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");
           
            String stn = "DELETE FROM users.comment WHERE postId= "+id+" ";
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(stn);
           
            String str = "DELETE FROM users.Posting WHERE postId= ? ";
            PreparedStatement ps = connection.prepareStatement(str);
            ps.setString(1, id);
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
