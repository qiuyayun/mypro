/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.UpdateFee;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author qiuyayun
 */
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String userName = request.getParameter("userName");
            String pass = request.getParameter("password");
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            //url ="jdbc:mysql://localhost:3306/Library";
            //username = "root" ;        
            //password = "pass";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement ps;
                ResultSet rs;
                ps = conn.prepareStatement("select * from users where userName=? and pass=?");
                ps.setString(1, userName);
                ps.setString(2, pass);
                rs = ps.executeQuery();
                if (rs.next()) {
                    new UpdateFee(userName);
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", userName);
                    response.sendRedirect("Individual.jsp");
                    if (rs.getInt("VIP") == 1) {
                        session.setAttribute("total", 10);
                        session.setAttribute("number", rs.getInt("number"));
                    } else {
                        session.setAttribute("total", 4);
                        session.setAttribute("number", rs.getInt("number"));
                    }
                    
                    System.out.println(rs.getInt("number"));
                } else {
                    out.println("<script>alert(\"Wrong.\");</script>");
                    out.println("<script>location.replace(document.referrer);</script>");//获取上一访问页面的url地址
                }
            } catch (Exception e) {
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
