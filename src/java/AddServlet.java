/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author qiuyayun
 */
public class AddServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final long serialVersionUID = 1L;
     
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                String id = null, title=null, author=null, class_=null,price=null, publisher=null, ex = null;
                FileItem it = null;
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (!ServletFileUpload.isMultipartContent(request)) {//判断提交上的数据是不是上传的表单数据。
		    // 如果不是则停止
		    //PrintWriter writer = response.getWriter();
		    //writer.println("Error: 表单必须包含 enctype=multipart/form-data");
		    //writer.flush();
		    return;
		}
            // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = "C:\\Users\\qiuyayun\\Desktop\\毕业设计\\LB\\web\\picture";//根据实际情况修改目录，netbeans需使用绝对路径。
       
         
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
            
        
        try {
            // 解析请求的内容提取文件数据
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
             Class.forName(s.getInitParameter("driver"));//动态加载jdbc驱动
                Connection conn = DriverManager.getConnection(url, username, password);
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                       String fileName = new File(item.getName()).getName();
                       String []fn=fileName.split("\\.");//
                       System.out.println("sajkd"+item.getName());//
                         ex=fn[fn.length-1];//
//                        String filePath = uploadPath + File.separator + fileName;
                        
//                        // 在控制台输出文件的上传路径
//                        System.out.println(filePath);
                        // 保存文件到硬盘
                        //item.write(storeFile);
                        it=item;
                        request.setAttribute("message",
                            "文件上传成功!");
                    }else{
                    String name=item.getFieldName();
                    String value=item.getString();
                    
            if(name.equals("title"))
                        title=value;
                    if(name.equals("author"))
                        author=value;
                    if(name.equals("class"))
                        class_=value;
                    if(name.equals("publisher"))
                        publisher=value;
                    if(name.equals("price"))
                        price=value;
            if(name.equals("id")){
                id=value;
           
                    PreparedStatement ps;

                    ps = conn.prepareStatement("select * from Books where id=?");
                    ps.setString(1, value);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next()){
                    response.sendRedirect("error.jsp");
                    return ;
                    }
            }
                    }
                }
            }
            File storeFile = new File(uploadPath+"\\"+id+"."+ex);
            it.write(storeFile);
            PreparedStatement ps = conn.prepareStatement("insert into Books values(?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, id);
                    ps.setString(2, new String(title.getBytes("ISO-8859-1"),"UTF-8"));
                    ps.setString(3, new String(author.getBytes("ISO-8859-1"),"UTF-8"));
                    ps.setString(4, new String(class_.getBytes("ISO-8859-1"),"utf-8"));
                    ps.setString(5, new String(publisher.getBytes("ISO-8859-1"),"UTF-8"));
                    ps.setFloat(6, Float.valueOf(price));
                    java.util.Date utilDate = new Date();
                    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                    ps.setInt(7, 0);
                    ps.setDate(8, sqlDate);
                    ps.setString(9, id+"."+ex);//
                    ps.execute();
                    out.println("<script>location.replace(document.referrer);</script>");
        } catch(Exception e){
        
        e.printStackTrace();
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
