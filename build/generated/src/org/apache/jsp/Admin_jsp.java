package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head style=\"position:fixed;\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>欢迎管理员</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/main.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/part.css\">\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("        <script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"mainBox\">\n");
      out.write("            <header>\n");
      out.write("                <div class=\"hd-wrap\">\n");
      out.write("                    <div class=\"headLeft\"><a href=\"\">图书馆管理系统</a></div>\n");
      out.write("                    <div class=\"headRight\">\n");
      out.write("                        <div class=\"user\">\n");
      out.write("                            <i class=\"glyphicon glyphicon-user\"></i>欢迎管理员\n");
      out.write("                            <a href=\"logout.jsp\">注销</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("            <div class=\"left\">\n");
      out.write("                <div class=\"panel-group\" id=\"accordion\" role=\"tablist\" aria-multiselectable=\"true\">\n");
      out.write("                    <div class=\"panel panel-default\">\n");
      out.write("                        <div class=\"panel-heading\" role=\"tab\" id=\"headingOne\">\n");
      out.write("                            <h4 class=\"panel-title\">\n");
      out.write("                                <a role=\"button\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseOne\" aria-expanded=\"true\" aria-controls=\"collapseOne\">\n");
      out.write("                                    <i class=\"glyphicon glyphicon-book\"></i>图书管理\n");
      out.write("                                </a>\n");
      out.write("                            </h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"collapseOne\" class=\"panel-collapse collapse in\" role=\"tabpanel\" aria-labelledby=\"headingOne\">\n");
      out.write("                            <div class=\"panel-body\">\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"addBook.jsp\" target=\"content\"><i class=\"glyphicon glyphicon-plus\"></i>添加图书</a></li>\n");
      out.write("                                    <li><a href=\"searchBook.jsp\" target=\"content\"><i class=\"glyphicon glyphicon-search\"></i>查询图书</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"panel panel-default\">\n");
      out.write("                        <div class=\"panel-heading\" role=\"tab\" id=\"headingTwo\">\n");
      out.write("                            <h4 class=\"panel-title\">\n");
      out.write("                                <a class=\"collapsed\" role=\"button\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\n");
      out.write("                                    <i class=\"glyphicon glyphicon-user\"></i>读者管理\n");
      out.write("                                </a>\n");
      out.write("                            </h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\">\n");
      out.write("                            <div class=\"panel-body\">\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"userList.jsp\" target=\"content\"><i class=\"glyphicon glyphicon-th-list\"></i>读者信息</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"panel panel-default\">\n");
      out.write("                        <div class=\"panel-heading\" role=\"tab\" id=\"headingThree\">\n");
      out.write("                            <h4 class=\"panel-title\">\n");
      out.write("                                <a class=\"collapsed\" role=\"button\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("                                    <i class=\"glyphicon glyphicon-arrow-up\"></i>借书管理\n");
      out.write("                                </a>\n");
      out.write("                            </h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\">\n");
      out.write("                            <div class=\"panel-body\">\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"borrowList.jsp\" target=\"content\"><i class=\"glyphicon glyphicon-th-list\"></i>借还信息列表</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"right\" id=\"right\">\n");
      out.write("                <iframe href=\"\" name=\"content\" frameborder=\"0\" scrolling=\"yes\" width=\"100%\" height=\"100%\"></iframe>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"js/jquery-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
