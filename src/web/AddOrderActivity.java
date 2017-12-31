package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBUtil;

/**
 * Servlet implementation class AddOrderActivity
 */
@WebServlet("/AddOrderActivity")
public class AddOrderActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderActivity() {
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
		String realName = request.getParameter("joinname");
		String phoneNumber = request.getParameter("linkphone");
		String activityType = request.getParameter("activity");
		String checkInDate = request.getParameter("jointime");
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");
        String review = "0";
        String passOrNotPass = " ";
        Connection conn = DBUtil.getConnection();
        PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement("insert into orderActivity(userName,realName,phoneNumber,activityType,checkInDate,review,passOrNotPass) values(?,?,?,?,?,?,?)");
		    preparedStatement.setString(1, userName);
		    preparedStatement.setString(2, realName);
		    preparedStatement.setString(3, phoneNumber);
		    preparedStatement.setString(4, activityType);
		    preparedStatement.setString(5, checkInDate);
		    preparedStatement.setString(6, review);
		    preparedStatement.setString(7, passOrNotPass);
		    preparedStatement.executeUpdate();
		    conn.close();
		    String url = (String) session.getAttribute("url");
		    response.sendRedirect(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("插入数据失败！",e);
		}
  
        
	}

}
