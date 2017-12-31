package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

public class updateUser extends HttpServlet {
	public void service(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		//String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		String name = request.getParameter("name");
		name = URLDecoder.decode(name, "UTF-8");
		//System.out.print(name);
		try{
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement prep = conn.prepareStatement("select count(name) from users where name = ?");
		prep.setString(1, name);
		//prep.executeQuery();
		ResultSet rs = prep.executeQuery();
		while(rs.next()){
			if(rs.getInt(1) == 1){
				PrintWriter out = response.getWriter();
				out.print("false");
				//System.out.print("false");
			}else{
				PrintWriter out = response.getWriter();
				out.print("true");
				//System.out.print("true");
			}
		}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
