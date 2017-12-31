package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

public class AddUser extends HttpServlet{
	
	public void service(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
	    String name = request.getParameter("username");
	    String pwd = request.getParameter("password");
	    //System.out.print(name);
	    String headImageUrl = "/upload/headImages/default.jpg";
	    try {
		    Connection conn = null;
		    conn = DBUtil.getConnection();
		    PreparedStatement prep = conn.prepareStatement("insert into users(name,headImageUrl,sex,pwd,conninfo,introduce,ifadmin) values(?,?,?,?,?,?,?)");
		    prep.setString(1, name);
		    prep.setString(2, headImageUrl);
		    prep.setString(3, "0");
		    prep.setString(4, pwd);
		    prep.setString(5, "12345678910");
		    prep.setString(6, "Hello,World!");
		    prep.setString(7, "0");
		    prep.executeUpdate();
		    //System.out.print(name);
		    conn.close();
		    response.sendRedirect(request.getContextPath() + "/sxw/signup.jsp");
	    } catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	    
		
	}

}
