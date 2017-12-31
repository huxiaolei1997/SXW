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
 * Servlet implementation class CheckUserLogin
 */
@WebServlet("/CheckUserLogin")
public class CheckUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String checkUserLogin = request.getParameter("checkUserLogin");
		//System.out.print(username);
		HttpSession session = request.getSession();
		String url = (String) session.getAttribute("url");
		
		if(checkUserLogin != null && checkUserLogin.equals("1")){
			try {
				userDao userDao = new userDao();
			    User user = userDao.findUser(username);
				session.setAttribute("userName", username);
				session.setAttribute("userInfo", user);
				session.removeAttribute("urlLogin");
				//String userName = (String) session.getAttribute("userName");
				//System.out.print(userName);
				response.sendRedirect(url);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询用户信息失败！",e);
			}
		
		}
		if(name != null){
			name = URLDecoder.decode(name,"UTF-8");
		}
		PrintWriter out = response.getWriter();
		Connection conn = null;
		conn = DBUtil.getConnection();
		if (checkUserLogin !=null  && checkUserLogin.equals("0")) {
			try {
				PreparedStatement prep = conn.prepareStatement("select count(*) from users where name = ? and pwd = ?");
				prep.setString(1, name);
				prep.setString(2, pwd);
				ResultSet rs = prep.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 1) {
						out.print("true");
						// System.out.print(name);
						 //System.out.print(rs.getInt(1));
						// response.sendRedirect("success.html");
					} else {
						out.print("false");
						// System.out.print(name);
					}
				}
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		}
	}

}
