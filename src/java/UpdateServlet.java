/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author qiuyayun
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        try (PrintWriter out = response.getWriter()) {
             ServletContext s=this.getServletContext();
             String url =s.getInitParameter("url");
             String username = s.getInitParameter("username") ;   
             String password = s.getInitParameter("password") ;  
             String id=request.getParameter("id");
             //String author=request.getParameter("author");
             String author=new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
             //String title=request.getParameter("title");
             String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
             //String class_=request.getParameter("class");
             String class_=new String(request.getParameter("class").getBytes("ISO-8859-1"),"UTF-8");
             float price=Float.valueOf(request.getParameter("price"));
             //String publisher=request.getParameter("publisher");
             String publisher=new String(request.getParameter("publisher").getBytes("ISO-8859-1"),"UTF-8");
             try{
                Class.forName(s.getInitParameter("driver"));
                Connection conn = DriverManager.getConnection(url,username,password);
                PreparedStatement ps;
                ps=conn.prepareStatement("update Books set title=?,author=?,class=?,publisher=?,price=?,in_date=? where id="+id);
                //ps.setString(1, id);
                ps.setString(1, title);
                ps.setString(2, author);
                ps.setString(3, class_);
                ps.setString(4, publisher);
                ps.setFloat(5, price);
                java.util.Date utilDate=new Date();
                java.sql.Date sqlDate=new java.sql.Date(utilDate.getTime());
                // ps.setInt(, 0);
                ps.setDate(6, sqlDate);
                ps.execute();
                out.println("<script>location.replace(document.referrer);</script>");
                  }catch(Exception e){
                  System.err.println(e);
                  }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
