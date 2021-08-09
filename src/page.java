

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

import JavaCode.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;

/**
 * Servlet implementation class page
 */
@WebServlet("/page/*")
public class page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter outPrintWriter = response.getWriter();
		System.out.println(request.getRequestURI());
		String sql = MessageFormat.format("select * from website where pid=\"{0}\"", request.getRequestURI());
		Connection connection = JDBCUtils.getConnection();
		ResultSet resultSet = null;
		try {
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		String html = null;
		try {
			while(resultSet.next()) {
				html = "<!DOCTYPE HTML>\n"
						+ "<html>\n"
						+ "<head>\n"
						+ MessageFormat.format("	<title>{0}</title>\n", resultSet.getString(2))
						+ "	<link href=\"/Blog/static/css/bootstrap.css\" rel='stylesheet' type='text/css' />\n"
						+ "	<link href=\"/Blog/static/css/style.css\" rel='stylesheet' type='text/css' />\n"
						+ "	<link rel=\"icon\" type=\"/image/png\" href=\"/Blog/static/images/icon3.png\"/>\n"
						+ "	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
						+ "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
						+ "\n"
						+ "	<script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n"
						+ "		<link href='http://fonts.googleapis.com/css?family=Oswald:100,400,300,700' rel='stylesheet' type='text/css'>\n"
						+ "		<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,300italic' rel='stylesheet' type='text/css'>\n"
						+ "		  <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\n"
						+ "		<!--end slider -->\n"
						+ "		<!--script-->\n"
						+ "<script type=\"text/javascript\" src=\"/Blog/static/js/move-top.js\"></script>\n"
						+ "<script type=\"text/javascript\" src=\"/Blog/static/js/easing.js\"></script>\n"
						+ "<!--/script-->\n"
						+ "<script type=\"text/javascript\">\n"
						+ "			jQuery(document).ready(function($) {\n"
						+ "				$(\".scroll\").click(function(event){		\n"
						+ "					event.preventDefault();\n"
						+ "					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);\n"
						+ "				});\n"
						+ "			});\n"
						+ "</script>\n"
						+ "<!---->\n"
						+ "\n"
						+ "</head>\n"
						+ "<body>\n"
						+ "	\n"
						+ "	<script type=\"text/javascript\" src=\"/Blog/static/js/background.js\"></script>\n"
						+ "	\n"
						+ "<!---header---->			\n"
						+ "<div class=\"header\">  \n"
						+ "	 <div class=\"container\">\n"
						+ "		  <div class=\"logo\">\n"
						+ "			  <a href=\"/Blog/index.jsp\"><img src=\"/Blog/static/images/logo.jpg\" title=\"\" /></a>\n"
						+ "		  </div>\n"
						+ "			 <!---start-top-nav---->\n"
						+ "			 <div class=\"top-menu\">\n"
						+ "				 \n"
						+ "				  <span class=\"menu\"> </span> \n"
						+ "				   <ul>\n"
						+ "						<li class=\"active\"><a href=\"/Blog/index.jsp\">主页</a></li>\n"
						+ "						<li><a href=\"/Blog/about.jsp\" style=\"color: #00AEFF;\">关于</a></li>\n"
						+ "						<li><a href=\"/Blog/situation.jsp\" style=\"color: #00AEFF;\">形势与政策</a></li>";
						if (session.getAttribute("user") == null) {
							html += "						<li><a href=\"/Blog/register.jsp\" style=\"color: #00AEFF;\">注册</a></li>";
							html += "						<li><a href=\"/Blog/login.jsp\" style=\"color: #00AEFF;\">登陆</a></li>";
						} else {
							html += "						<li><a href=\"/Blog/exit.jsp\" style=\"color: #00AEFF;\">退出</a></li>";
						}
						html = html + "						<div class=\"clearfix\"> </div>\n"
						+ "				 </ul>\n"
						+ "			 </div>\n"
						+ "			 <div class=\"clearfix\"></div>\n"
						+ "					<script>\n"
						+ "					$(\"span.menu\").click(function(){\n"
						+ "					$(\".top-menu ul\").slideToggle(\"slow\" , function(){\n"
						+ "					});\n"
						+ "					});\n"
						+ "					</script>\n"
						+ "				<!---//End-top-nav---->					\n"
						+ "	 </div>\n"
						+ "</div>\n"
						+ "<!--/header-->\n"
						+ "<div class=\"single\">\n"
						+ "	 <div class=\"container\">\n"
						+ "		  <div class=\"col-md-8 single-main\">				 \n"
//						+ "			  <div class=\"single-grid\">\n"
						+ MessageFormat.format("					{0}\n", StringEscapeUtils.unescapeHtml4((resultSet.getString(5))))
//						+ "			  </div>\n"
						+ "			 <ul class=\"comment-list\">\n"
						+ MessageFormat.format("		  		   <h5 class=\"post-author_head\">Written by {0}<a href=\"#\" title=\"   Posts by admin\" rel=\"author\">admin</a></h5>\n", resultSet.getString(6))
						+ "		  		   <li><img src=\"/Blog/static/images/avatar.png\" class=\"img-responsive\" alt=\"\">\n"
						+ "		  		   <div class=\"desc\">\n"
						+ "		  		   </div>\n"
						+ "		  		   <div class=\"clearfix\"></div>\n"
						+ "		  		   </li>\n"
						+ "		  	  </ul>\n"
						+ "		  </div>\n"
						+ "	  </div>\n"
						+ "</div>\n"
						+ "<!---->\n"
						+ "</body>\n"
						+ "</html>";
			}
			connection.close();
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql);
		outPrintWriter.print(html);
		outPrintWriter.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
