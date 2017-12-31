package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOut
 */
@WebServlet("/LoginOut")
public class LoginOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// request.getRequestURI();
		 String path = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		//System.out.print(path);
		if (path.equals("/loginOut")) {
			HttpSession session = request.getSession();
			session.removeAttribute("adminName");
			session.removeAttribute("HeadImageUrl");
			response.sendRedirect(request.getContextPath() + "/test2/login.jsp");
		}
		String path1 = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		//System.out.print(path1);
		if(path1.equals("/loginout")){
			HttpSession session = request.getSession();
			String url = (String) session.getAttribute("url");
			String urlLogin = (String) session.getAttribute("urlLogin");
			 if(urlLogin != null && url != null){
				session.removeAttribute("userName");
				session.removeAttribute("userInfo");
				//session.removeAttribute("urlLogin");
				response.sendRedirect(urlLogin);
			} else {
				session.removeAttribute("userName");
				session.removeAttribute("userInfo");
				response.sendRedirect(url);
			}

			
		}

	}

}
