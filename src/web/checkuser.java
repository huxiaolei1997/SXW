package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

import util.DBUtil;

public class checkuser extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// String name = new
		// String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		String pwd = request.getParameter("pwd");
		String conninfo = request.getParameter("conninfo");
		// String introduce = "hello";
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String ifadmin = request.getParameter("ifadmin");
		String sex = request.getParameter("sex");
		// System.out.print(ifadmin);
		String checkUpdateUser = "";
		String introduce = request.getParameter("introduce");
		checkUpdateUser = request.getParameter("checkUpdateUser");
		name = URLDecoder.decode(name, "UTF-8");
		introduce = URLDecoder.decode(introduce, "UTF-8");
		//System.out.print(id + "," + name + "," + pwd + "," + conninfo + "," + introduce + "," + ifadmin + "," + checkUpdateUser);
		// System.out.print(checkUpdateUser);
		Connection conn = null;
		conn = DBUtil.getConnection();
		try {
			if (checkUpdateUser != null && checkUpdateUser.equals("checkUpdateUser")) {
				PreparedStatement prep = conn.prepareStatement("select id from users where name = ?");
				prep.setString(1, name);
				// prep.executeQuery();
				ResultSet rs = prep.executeQuery();
				if (rs.next()) {
					if (rs.getLong("id") != Integer.valueOf(id)) { //判断要修改的用户名是否已经存在，同时防止修改当前用户名报错
						PrintWriter out = response.getWriter();
						out.print("false");
						//System.out.print("false");
					} else if(rs.getLong("id") == Integer.valueOf(id)){
						
						PrintWriter out = response.getWriter();
						PreparedStatement preparedStatement = conn.prepareStatement(
								"update users set name = ?,pwd = ?,conninfo = ?,introduce = ?,ifadmin = ?,sex = ? where id = ?");
						preparedStatement.setString(1, name);
						preparedStatement.setString(2, pwd);
						preparedStatement.setString(3, conninfo);
						preparedStatement.setString(4, introduce);
						preparedStatement.setString(5, ifadmin);
						preparedStatement.setString(6, sex);
						preparedStatement.setString(7, id);
						preparedStatement.executeUpdate();
						out.print("true");
						rs.close();
						preparedStatement.close();
						conn.close();
					}
				}
				else {
						PrintWriter out = response.getWriter();
						PreparedStatement preparedStatement = conn.prepareStatement(
								"update users set name = ?,pwd = ?,conninfo = ?,introduce = ?,ifadmin = ?,sex = ? where id = ?");
						preparedStatement.setString(1, name);
						preparedStatement.setString(2, pwd);
						preparedStatement.setString(3, conninfo);
						preparedStatement.setString(4, introduce);
						preparedStatement.setString(5, ifadmin);
						preparedStatement.setString(6, sex);
						preparedStatement.setString(7, id);
						preparedStatement.executeUpdate();
						preparedStatement.close();
						conn.close();
						out.print("true");
						// System.out.print("true");
					}
				

			}
		
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
