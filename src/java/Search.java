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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author qiuyayun
 */
public class Search extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            PreparedStatement ps;

            Class.forName(s.getInitParameter("driver"));// 动态加载mysql驱动
            Connection conn = DriverManager.getConnection(url, username, password);
            ResultSet rs;
            String select = request.getParameter("select");

            if (select.equals("id")) {
                String id = request.getParameter("id");
                ps = conn.prepareStatement("select * from Books where id=?");
                ps.setString(1, id);
                rs = ps.executeQuery();
            } else if (select.equals("title")) {
                String title = request.getParameter("title");
                ps = conn.prepareStatement("select * from Books where title=?");
                ps.setString(1, title);
                rs = ps.executeQuery();
            } else if (select.equals("author")) {
                String author = request.getParameter("author");
                ps = conn.prepareStatement("select * from Books where author=?");
                ps.setString(1, author);
                rs = ps.executeQuery();
            } else {
                String class_ = request.getParameter("class");
                ps = conn.prepareStatement("select * from Books where class=?");
                ps.setString(1, class_);
                rs = ps.executeQuery();
            }
            ArrayList list = new ArrayList();
            while (rs.next()) {
                list.add(new Books(rs.getString("id"), rs.getString("title"), rs.getString("author"), rs.getString("publisher"), rs.getString("in_date"), rs.getString("price"), rs.getInt("statu"), rs.getString("class")));
            }
            request.setAttribute("list", list);

            request.getRequestDispatcher("/BookResult.jsp?pageNo=0").forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
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
