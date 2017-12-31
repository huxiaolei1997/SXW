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
import javax.servlet.http.HttpSession;

import util.DBUtil;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id = request.getParameterValues("id[]");
		String deleteUser = request.getParameter("deleteUser");
		String deleteComment = request.getParameter("deleteComment");
		String userId = request.getParameter("userId");
		String deleteOneUser = request.getParameter("deleteOneUser");
		String commentId = request.getParameter("commentId");
		String deleteOneComment = request.getParameter("deleteOneComment");
		HttpSession session = request.getSession();
		// String urldelete = (String) session.getAttribute("urldelete");
		String url = (String) session.getAttribute("url");
		// System.out.print(id);
		// System.out.print(deleteUser);
		Connection conn = null;
		conn = DBUtil.getConnection();
		if (deleteUser != null && deleteUser.equals("deleteUser")) {
			try {
				PreparedStatement prep = conn.prepareStatement("delete from users where id= ?");
				if (id.length > 0) {
					for (int i = 0; i < id.length; i++) {
						prep.setString(1, id[i]);
						prep.addBatch();
					}
				}
				prep.executeBatch();
				// PrintWriter out = response.getWriter();
				// out.print("success");
				prep.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(url);
			// response.sendRedirect(url);
		}
		if (deleteComment != null && deleteComment.equals("deleteComment")) {
			try {
				PreparedStatement prep = conn.prepareStatement("delete from comment where id= ?");
				if (id.length > 0) {
					for (int i = 0; i < id.length; i++) {
						prep.setString(1, id[i]);
						prep.addBatch();
					}
				}
				prep.executeBatch();
				prep.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(url);
		}
		if (deleteOneUser != null && deleteOneUser.equals("deleteOneUser")) {
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("delete from users where id = ?");
				preparedStatement.setString(1, userId);
				preparedStatement.executeUpdate();
				PrintWriter out = response.getWriter();
				out.print("success");
				preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		// request.getRequestDispatcher("/test2/pagerUser").forward(request,
		// response);
		if (deleteOneComment != null && deleteOneComment.equals("deleteOneComment")) {
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("delete from comment where id = ?");
				preparedStatement.setString(1, commentId);
				preparedStatement.executeUpdate();
				PrintWriter out = response.getWriter();
				out.print("success");
				preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
