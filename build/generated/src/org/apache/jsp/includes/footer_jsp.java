package org.apache.jsp.includes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<footer>\n");
      out.write("    <section>\n");
      out.write("        <img src=\"./img/preuba.webp\" onerror=\"this.onerror=null; this.src='../img/preuba.webp';\">\n");
      out.write("        <h2>Contacta a un experto</h2>\n");
      out.write("        \n");
      out.write("        <a href=\"\"><p>CORREO</p></a>\n");
      out.write("        \n");
      out.write("        <button class=\"btn-chat\">Chatear ahora</button>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <section>\n");
      out.write("        <article>\n");
      out.write("            <h2>Contacto</h2>\n");
      out.write("            <h2>Informacion</h2>\n");
      out.write("        </article>\n");
      out.write("        <article>\n");
      out.write("            <img src=\"./img/tiktokdg.png\" onerror=\"this.onerror=null; this.src='../img/tiktokdg.png';\">\n");
      out.write("            <img src=\"./img/fbdg.png\" onerror=\"this.onerror=null; this.src='../img/fbdg.png';\">\n");
      out.write("            <img src=\"./img/instadg.png\" onerror=\"this.onerror=null; this.src='../img/instadg.png';\">\n");
      out.write("\n");
      out.write("        </article>\n");
      out.write("    </section>\n");
      out.write("</footer>\n");
      out.write("</body>\n");
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
