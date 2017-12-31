package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;
import entity.User;
import util.DBUtil;

/**
 * Servlet implementation class CheckAdmin
 */
@WebServlet("/CheckAdmin")
public class CheckAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckAdmin() {
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
	 * @adminName 管理员用户名
	 * @password 密码
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String adminName = request.getParameter("adminName");
		String password = request.getParameter("password");
		String text = "";
	    text = request.getParameter("text");
		adminName = URLDecoder.decode(adminName, "UTF-8");
		String path = request.getContextPath();
		// System.out.print(text);
		if ( text != null && text.equals("1") ) {
			HttpSession session = request.getSession();
			userDao userDao = new userDao();
			try {
				List<User> singleUser = userDao.querySingleUsers(adminName);
				for(User a : singleUser){
					session.setAttribute("HeadImageUrl", a.getHeadImageUrl());
				}
				session.setAttribute("adminName", adminName); //将管理员的用户名保存到session中
				response.sendRedirect(path + "/test2/showBackIndex");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询用户信息失败！",e);
			}
			
		}
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement;

		try {
			preparedStatement = conn
					.prepareStatement("select count(*) from users where name = ? and pwd = ? and ifadmin = '1'");
			preparedStatement.setString(1, adminName);
			preparedStatement.setString(2, password);
			ResultSet rSet = preparedStatement.executeQuery();
			while (rSet.next()) {

				if (rSet.getInt(1) == 1) {
					PrintWriter out = response.getWriter();
					// request.getRequestDispatcher("/sxw/test2/index.html").forward(request,
					// response);
					out.print("true");
					// response.sendRedirect("/sxw/test2/index.html");
				} else {
					PrintWriter out = response.getWriter();
					out.print("false");
				}
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
