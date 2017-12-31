package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;

/**
 * Servlet implementation class UpdateUserPwd
 */
@WebServlet("/UpdateUserPwd")
public class UpdateUserPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserPwd() {
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
		String oldPwd = request.getParameter("oldPassword");
		String newPwd = request.getParameter("newPassword");
		String ifuser = request.getParameter("ifuser");
		String adminName = "";
		if (ifuser != null) {
			HttpSession session = request.getSession();
			adminName = (String) session.getAttribute("userName"); // 获取当前登录的普通用户的用户名
		} else if (ifuser == null) {
			HttpSession session = request.getSession();
			adminName = (String) session.getAttribute("adminName"); // 获取当前登录的管理员用户名
		}

		userDao userDao = new userDao();
		try {
			String out = userDao.queryUpdatePwd(adminName, oldPwd, newPwd, request);
			PrintWriter out2 = response.getWriter();
			out2.print(out);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
