package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

/**
 * Servlet implementation class CheckComment
 */
@WebServlet("/CheckComment")
public class CheckComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckComment() {
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
		String commentName = request.getParameter("commentName");
		String commentId = request.getParameter("commentId");
		String commentType = request.getParameter("commentType");
		String content = request.getParameter("content");
		String addComment = request.getParameter("addComment");
		String updateComment = request.getParameter("updateComment");
		String commentTimeUpdate = request.getParameter("commentTimeUpdate");
		String id = request.getParameter("id");
		String state = request.getParameter("state");
		commentName = URLDecoder.decode(commentName, "UTF-8");
		content = URLDecoder.decode(content, "UTF-8");
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String commentTime = sdFormatter.format(nowTime);
		if (commentType.equals("0")) {
			commentType = "story";
		} else if (commentType.equals("1")) {
			commentType = "view";
		} else if(commentType.equals("2")){
			commentType = "experience";
		}
		Connection conn = null;
		conn = DBUtil.getConnection();
		if(addComment != null && addComment.equals("addComment")){
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("select count(name) from users where name = ?");
				preparedStatement.setString(1, commentName);
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 1) {
						//System.out.print(rs.getInt(1));
						//System.out.print(commentName + "," + content + "," + commentTime + "," + commentId + "," + commentType);
						PreparedStatement prep = conn.prepareStatement(
								"insert into comment(commentName,content,commentTime,commentId,commentType) values(?,?,?,?,?)");
						prep.setString(1, commentName);
						prep.setString(2, content);
						prep.setTimestamp(3, Timestamp.valueOf(commentTime));
						prep.setString(4, commentId);
						prep.setString(5, commentType);
						prep.executeUpdate();
						PrintWriter out = response.getWriter();
						out.print("true");
					}
					else {
						//System.out.print(commentName + "," + content + "," + commentTime + "," + commentId + "," + commentType);
						PrintWriter out = response.getWriter();
						out.print("false");
					}
				} 

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				throw new RuntimeException("查询用户失败", e);
			}
			
		}
		if(updateComment != null && updateComment.equals("updateComment")){
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("select count(name) from users where name = ?");
				preparedStatement.setString(1,commentName);
				ResultSet rSet = preparedStatement.executeQuery();
				while(rSet.next()){
					if(rSet.getInt(1) == 1){
						PreparedStatement prep = conn.prepareStatement(
								"update  comment set commentName = ?, content = ?, commentTime = ?,commentId = ?,commentType = ?,state = ? where id = ?");
						prep.setString(1, commentName);
						prep.setString(2, content);
						prep.setTimestamp(3, Timestamp.valueOf(commentTimeUpdate));
						prep.setString(4, commentId);
						prep.setString(5, commentType);
						prep.setString(6, state);
						prep.setString(7, id);
						prep.executeUpdate();
						PrintWriter out = response.getWriter();
						out.print("true");
					}else {
						//System.out.print(commentName + "," + content + "," + commentTime + "," + commentId + "," + commentType);
						PrintWriter out = response.getWriter();
						out.print("false");
					}
				}
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

	}

}
