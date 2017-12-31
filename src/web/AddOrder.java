package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBUtil;

/**
 * Servlet implementation class AddOrder
 */
@WebServlet("/AddOrder")
public class AddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrder() {
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
		String realName = request.getParameter("user-name");
		String phoneNumber = request.getParameter("user-phone");
		String houseType = request.getParameter("user-house");
		String checkInDate = request.getParameter("user-rudate");
		String checkOutDate = request.getParameter("user-lidate");
		String checkInNumber = request.getParameter("user-number");
		String requirement = request.getParameter("user-require");
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		String review = "0";
		String passOrNotPass = " ";
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement("insert into orderXiangJu(userName,realName,phoneNumber,houseType,checkInDate,checkOutDate,checkInNumber,requirement,review,passOrNotPass) values(?,?,?,?,?,?,?,?,?,?)");
	        preparedStatement.setString(1, userName);
	        preparedStatement.setString(2, realName);
	        preparedStatement.setString(3, phoneNumber);
	        preparedStatement.setString(4, houseType);
	        preparedStatement.setString(5, checkInDate);
	        preparedStatement.setString(6, checkOutDate);
	        preparedStatement.setString(7, checkInNumber);
	        preparedStatement.setString(8, requirement);
	        preparedStatement.setString(9, review);
	        preparedStatement.setString(10, passOrNotPass);
	        preparedStatement.executeUpdate();
	        conn.close();
	        String url = (String) session.getAttribute("url");
	        response.sendRedirect(url);    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		throw new RuntimeException("数据插入失败！",e);
		}
	}

}
