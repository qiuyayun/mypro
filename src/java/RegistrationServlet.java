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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author qiuyayun
 */
public class RegistrationServlet extends HttpServlet {

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

        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            String userName = request.getParameter("userName");
            String pass = request.getParameter("password");
            String gender = request.getParameter("gender");
            String identity = request.getParameter("identity");
            String city = request.getParameter("city");
            String phone = request.getParameter("phone");

            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            try {
                Class.forName(s.getInitParameter("driver"));
                Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement ps;
                ResultSet rs;
                ps = conn.prepareStatement("select * from users where userName=?");
                ps.setString(1, userName);
                rs = ps.executeQuery();
                if (rs.next()) {
                    out.println("<script>alert(\"Please change a user name.\");</script>");

                } else {
                    ps = conn.prepareStatement("insert into users value(?,?,?,?,?,?,?,?)");
                    ps.setString(1, userName);
                    ps.setString(2, gender);
                    ps.setString(3, pass);
                    ps.setString(4, identity);
                    ps.setString(5, city);
                    ps.setString(6, phone);
                    ps.setInt(7, 0);
                    ps.setInt(8, 0);
                    ps.execute();
                    out.println("<script>alert(\"Succeed.\");</script>");
                }
                out.println("<script>location.replace(document.referrer);</script>");
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
