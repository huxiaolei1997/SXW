package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class checklogin extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("utf-8");
		//response.setContentType("text/html;charset=utf8");
		String name = request.getParameter("name");
		String checkuser = "";
		checkuser = request.getParameter("checkuser");
		String pwd = request.getParameter("pwd");
		name = URLDecoder.decode(name, "UTF-8");
		//System.out.print(checkuser + "," + name + "," + checklogin);
		PrintWriter out = response.getWriter();
		Connection conn = null;
		conn = DBUtil.getConnection();
		try {
			/*
			 * 检查用户名是否已经存在，并返回true或false到客户端
			 */
			if (checkuser != null && checkuser.equals("checkuser")) {
				PreparedStatement prep = conn.prepareStatement("select count(name) from users where name = ?");
				prep.setString(1, name);
				ResultSet rs = prep.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 1) {
						out.print("false");
						 //System.out.print("");
						// System.out.print(rs.getInt(1));
						// response.sendRedirect("success.html");
					} else {
						out.print("true");
						// System.out.print(rs.getInt(1));
						// System.out.print("false");
					}
				}

			}
			conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
