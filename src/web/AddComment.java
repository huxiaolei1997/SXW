package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBUtil;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddComment() {
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
		String commentOrReply = request.getParameter("commentOrReply");
		String commentName = request.getParameter("commentName");
		String commentId = request.getParameter("commentId");
		String commentType = request.getParameter("commentType");
		String content = request.getParameter("comment");
		String parentCommentId = request.getParameter("parentCommentId");
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String commentTime = sdFormatter.format(nowTime);
		Connection conn = null;
		conn = DBUtil.getConnection();
		if(commentOrReply.equals("comment")){
			try {
				PreparedStatement preparedStatement = conn.prepareStatement(
						"insert into comment(commentName,content,commentTime,commentId,commentType) values(?,?,?,?,?)");
				preparedStatement.setString(1, commentName);
				preparedStatement.setString(2, content);
				preparedStatement.setTimestamp(3, Timestamp.valueOf(commentTime));
				preparedStatement.setString(4, commentId);
				preparedStatement.setString(5, commentType);
				preparedStatement.executeUpdate();
				HttpSession session = request.getSession();
				String url = (String) session.getAttribute("url");
				response.sendRedirect(url);
	            preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		if(commentOrReply.equals("reply")){
			try {
				PreparedStatement preparedStatement = conn.prepareStatement(
						"insert into replyComment(replyCommentUserName,parentCommentId,replyContent,commentTime,commentType,state) values(?,?,?,?,?,?)");
				preparedStatement.setString(1, commentName);
				preparedStatement.setString(2, parentCommentId);
				preparedStatement.setString(3, content);
				preparedStatement.setString(4, commentTime);
				preparedStatement.setString(5, commentType);
				preparedStatement.setString(6, "1");
				preparedStatement.executeUpdate();
				HttpSession session = request.getSession();
				String url = (String) session.getAttribute("url");
				response.sendRedirect(url);
	            preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	}

}
