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

import util.DBUtil;

/**
 * Servlet implementation class UpdateOrderActivity
 */
@WebServlet("/UpdateOrderActivity")
public class UpdateOrderActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateOrderActivity() {
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
		String id = request.getParameter("updateId");
		String checkInDate = request.getParameter("checkInDate");
		String activityType = request.getParameter("activityType");
		String passOrNotPass = request.getParameter("passOrNotPass");
		if (passOrNotPass.equals("")) {
			passOrNotPass = " ";
		} else {
			passOrNotPass = request.getParameter("passOrNotPass");
		}
		String review = "1";
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(
					"update orderActivity set checkInDate = ?,activityType = ?, passOrNotPass = ?,review = ? where id = ?");
			preparedStatement.setString(1, checkInDate);
			preparedStatement.setString(2, activityType);
			preparedStatement.setString(3, passOrNotPass);
			preparedStatement.setString(4, review);
			preparedStatement.setString(5, id);
			preparedStatement.executeUpdate();
			preparedStatement.close();
			conn.close();
			response.sendRedirect(request.getContextPath() + "/test2/showOrderActivity");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("更新活动订单数据失败！",e);
		}

	}
}
