/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * this code will on be compartible with users of glassfish server >4.0
 */
package Blog;

import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.COPY_ATTRIBUTES;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import java.util.Collection;
import java.util.logging.Level;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author USER
 */
@MultipartConfig
public class userimage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String endswith = "";
        String startwith = "";
        String filePathImg = null;

        String fname = request.getParameter("username");//getting the username of the image uploader for unique identification
        Part myloc = request.getPart("updateImag");//getting the image part of the image uploaded

        //-----------------------------------------------------------------------------
      

        Statement stmt = null;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");

            stmt = conn.createStatement();
            rs = stmt.executeQuery("select InfoImg from users.userimg where Username ='" + fname + "'");
            while (rs.next()) {

                filePathImg = rs.getString("InfoImg");
//                                                  
            }

        } catch (Exception e) {
            out.print("Unable to display image");
            out.print("Image display error=" + e);

        }
        
        

        String filePath = myloc.toString();//converting the part gotten from the uploaded image to string
        String fileName = myloc.getSubmittedFileName();//getting the submitted file name
        Long byteSize = myloc.getSize();//getting the size of the image 
        String formfield = myloc.getName();//getting the image name 

        if (!"".equals(fileName)) {

            if (filePath.startsWith("File name=" + fileName + ", StoreLocation=")) {
                startwith = "File name=" + fileName + ", StoreLocation=";
            }//checking if the part starts with the particular sequence just above

            if (filePath.endsWith(", size=" + byteSize + "bytes, isFormField=false, FieldName=" + formfield + "")) {

                endswith = ", size=" + byteSize + "bytes, isFormField=false, FieldName=" + formfield + "";
            }  //checking if the part ends with the particular sequence just above   

            int start = startwith.length();//getting the length of the starting part of the of the Path
            int end = endswith.length();//getting the length of the ending part of the of the Path
            int total = filePath.length();//getting the length of the total file path

            int offset = total - end;//getting the offsetted part of the ending part of the Path

            String image = myloc.toString();

            String imges = image;

            String filePathcopy = imges.substring(start, offset).replaceAll("\\\\", "/");//used to get the part specifically the Path of the image only and format the windows path type(\) to the java accepted part(/ or \\).

            String regno = request.getParameter("regnos");//getting the reg no of the image uploader
            String targetPath = "C:/Users/HP/Documents/NetBeansProjects/myBlog.com/web/Images/" + fileName + "";//getting the target file path which will be inserted into the database
            String relativePath = "Images/" + fileName + "";
            Path source = Paths.get(filePathcopy);//the source of the image
            Path target = Paths.get(targetPath);//the Path where the image will be moved to.

            try {
                Files.copy(source, target, REPLACE_EXISTING, COPY_ATTRIBUTES);
            } catch (IOException e) {
                System.out.println(e);
            }//used to copy the image to the target folder

            try {

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                try (Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=myBlog_com;user=sa;password=123456");) {
                    //setting auto commit false for concurrency which is true by default
                    con.setAutoCommit(false);

                    try (PreparedStatement ps = con.prepareStatement("update users.userimg set InfoImg = ? where RegistrationId = ?");) {
                        ps.setString(1, relativePath);
                        ps.setString(2, regno);

                        int img = ps.executeUpdate();
                        if (img > 0) {
                            Path deleteFile = Paths.get(filePathImg);
                            Files.deleteIfExists(deleteFile);
                            response.sendRedirect("Post.jsp");
                            con.commit();
                        } else {
                            out.print("<p style='text-align:center;background: #030831;color:red'>Login First Before Uploading your image</p>");
                            request.getRequestDispatcher("Post.jsp").include(request, response);
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.print("<p style='text-align:left;background: #030831;color:red'>Cannot update image from here click on edit info button below to update profile picture</p>");
                request.getRequestDispatcher("Post.jsp").include(request, response);
            }
        } else {
            out.print("<p style='text-align:left;color:red'>Error in Uploading your image Please select an image</p>");
            request.getRequestDispatcher("Post.jsp").include(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
