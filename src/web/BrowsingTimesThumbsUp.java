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
 * Servlet implementation class BrowsingTimesThumsUp
 */
@WebServlet("/BrowsingTimesThumsUp")
public class BrowsingTimesThumbsUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowsingTimesThumbsUp() {
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
	       String browsingTimes = request.getParameter("browsingTimes");
	       String id = request.getParameter("id");
	       Connection conn = null;
	       conn = DBUtil.getConnection();
	       try {
			PreparedStatement preparedStatement = conn.prepareStatement("update viewStory set browsingTimes = ? where id = ? ");
			preparedStatement.setString(1, browsingTimes);
			preparedStatement.setString(2, id);
			preparedStatement.executeUpdate();
			conn.close();
			PrintWriter out = response.getWriter();
			out.print("success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("增加浏览次数失败！",e);
		} 
	}
}
