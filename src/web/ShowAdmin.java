package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;
import entity.User;

/**
 * Servlet implementation class ShowAdmin
 */
@WebServlet("/ShowAdmin")
public class ShowAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowAdmin() {
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
		String path = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		if(path.equals("/showAdmin")){
			HttpSession session = request.getSession();
			String adminName = (String) session.getAttribute("adminName");
			userDao userDao = new userDao();
			try {
				List<User> singleUser = userDao.querySingleUsers(adminName);
				request.setAttribute("singleUser", singleUser);
				request.getRequestDispatcher("admin.jsp").forward(request, response);;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询管理员用户信息失败！", e);
			}
		}
	    if(path.equals("/showUser")){
	    	
	    	HttpSession session = request.getSession();
			String userName = (String) session.getAttribute("userName");
			if(userName != null){
				userDao userDao = new userDao();
				try {
					List<User> singleUser = userDao.querySingleUsers(userName);
					request.setAttribute("singleUser", singleUser);
					request.getRequestDispatcher("personal.jsp").forward(request, response);;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("查询普通用户信息失败！", e);
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/sxw/signup.jsp"); // 如果用户未登录直接访问这个页面，那就重定向到登录界面
			}
	    }

	}

}
