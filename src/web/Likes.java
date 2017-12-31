package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LikesDao;
import util.DBUtil;

/**
 * Servlet implementation class Likes
 */
@WebServlet("/Likes")
public class Likes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Likes() {
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
		String likes = request.getParameter("likes");
		if(likes.equals("findlikes")){
			String viewStory_id = request.getParameter("viewStory_id");
			HttpSession session = request.getSession();
			String userName = (String) session.getAttribute("userName");
			PrintWriter out = response.getWriter();
			Connection conn = null;
			conn = DBUtil.getConnection();
			PreparedStatement preparedStatement;
			try {
				preparedStatement = conn.prepareStatement("select count(*) from likes where viewStory_id = ? and userName = ?");
				preparedStatement.setString(1, viewStory_id);
				preparedStatement.setString(2, userName);
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 1) {
						out.print("1");
					} else if(rs.getInt(1) == 0){
						out.print("0");
					}

				}
				rs.close();
				preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询点赞信息失败！", e);
			}
			
		}
		
		if(likes.equals("likes")){
			String viewStory_id = request.getParameter("viewStory_id");
			HttpSession session = request.getSession();
			String userName = (String) session.getAttribute("userName");
			LikesDao likesDao = new LikesDao();
			PrintWriter out = response.getWriter();
			Connection conn = null;
			conn = DBUtil.getConnection();
			PreparedStatement preparedStatement;
			try {
				preparedStatement = conn.prepareStatement("select count(*) from likes where viewStory_id = ? and userName = ?");
				preparedStatement.setString(1, viewStory_id);
				preparedStatement.setString(2, userName);
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 0) {
						try {
							likesDao.addLikes(viewStory_id);
							likesDao.addLikesRecords(viewStory_id, userName);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							throw new RuntimeException("增加点赞信息失败！", e);
						}
						out.print("1");
					} else if (rs.getInt(1) == 1) {
						try {
							likesDao.reduceLikes(viewStory_id);
							likesDao.reduceLikesRecords(viewStory_id, userName);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							throw new RuntimeException("取消点赞信息失败！", e);
						}
						out.print("0");
					}

				}
				rs.close();
				preparedStatement.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询点赞信息失败！", e);
			}
		}
	

	}

}
