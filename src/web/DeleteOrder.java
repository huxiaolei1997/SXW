package web;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class DeleteOrder
 */
@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteOrder() {
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
		String id = request.getParameter("id");
		String order = request.getParameter("order");
		Connection conn = null;
		conn = DBUtil.getConnection();
		if (order.equals("orderXiangJu")) {
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("delete from orderXiangJu where id = ?");
				preparedStatement.setString(1, id);
				preparedStatement.executeUpdate();
				conn.close();
				preparedStatement.close();
				PrintWriter out = response.getWriter();
				out.print("success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("删除失败！", e);
			}

		}
		if (order.equals("orderActivity")) {
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("delete from orderActivity where id = ?");
				preparedStatement.setString(1, id);
				preparedStatement.executeUpdate();
				conn.close();
				preparedStatement.close();
				PrintWriter out = response.getWriter();
				out.print("success");
			} catch (SQLException e) {
				// TODO: handle exception
				throw new RuntimeException("删除活动订单失败！", e);
			}
		}
	}

}
