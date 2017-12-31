package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

public class checkAddUser extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd");
		String conninfo = request.getParameter("conninfo");
		String introduce = request.getParameter("introduce");
		String name = request.getParameter("name");
		//String id = request.getParameter("id");
		String ifadmin = request.getParameter("ifadmin");
		String sex = request.getParameter("sex");
		String headImageUrl = "/upload/headImages/default.jpg";
		String checkAddUser = "";
		name = URLDecoder.decode(name, "UTF-8");
		introduce = URLDecoder.decode(introduce, "UTF-8");
		checkAddUser = request.getParameter("checkAddUser");
		Connection conn = null;
		conn = DBUtil.getConnection();
		if (checkAddUser != null && checkAddUser.equals("checkAddUser")) {
			try {
				PreparedStatement prep = conn.prepareStatement("select count(name) from users where name = ?");
				prep.setString(1, name);
				// prep.executeQuery();
				//System.out.print(name);
				ResultSet rs1 = prep.executeQuery();
				while (rs1.next()) {
					// System.out.print(rs.getInt(1));
					if (rs1.getInt(1) == 1) {
						PrintWriter out = response.getWriter();
						//System.out.print("    " + rs1.getInt(1));
						out.print("false");
						// System.out.print("false");
					} else if (rs1.getInt(1) == 0) {
						PrintWriter out = response.getWriter();
						PreparedStatement preparedStatement = conn.prepareStatement(
								"insert into users(name,headImageUrl,sex,pwd,conninfo,introduce,ifadmin) values(?,?,?,?,?,?,?)");
						// System.out.print(" " + rs.getInt(1));
						preparedStatement.setString(1, name);
						preparedStatement.setString(2, headImageUrl);
						preparedStatement.setString(3, sex);
						preparedStatement.setString(4, pwd);
						preparedStatement.setString(5, conninfo);
						preparedStatement.setString(6, introduce);
						preparedStatement.setString(7, ifadmin);
						preparedStatement.executeUpdate();
						conn.close();
						out.print("true");
						// System.out.print("true");
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
	}
}
