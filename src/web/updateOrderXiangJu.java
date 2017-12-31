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
import javax.swing.text.Document;

import util.DBUtil;

/**
 * Servlet implementation class updateOrderXiangJu
 */
@WebServlet("/updateOrderXiangJu")
public class updateOrderXiangJu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateOrderXiangJu() {
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
		String id = request.getParameter("updateId");
		String checkInDate = request.getParameter("checkInDate");
		String checkOutDate = request.getParameter("checkOutDate");
		String checkInNumber = request.getParameter("checkInNumber");
		String requirement = request.getParameter("requirement");
		String passOrNotPass = request.getParameter("passOrNotPass");
		if(passOrNotPass.equals("")){
			passOrNotPass = " ";
		} else {
			passOrNotPass = request.getParameter("passOrNotPass");
		}
		String review = "1";
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement("update orderXiangJu set checkInDate = ?,checkOutDate = ?,checkInNumber = ?,requirement = ? , passOrNotPass = ?,review = ? where id = ?");
	        preparedStatement.setString(1, checkInDate);
	        preparedStatement.setString(2, checkOutDate);
	        preparedStatement.setString(3, checkInNumber);
	        preparedStatement.setString(4, requirement);
	        preparedStatement.setString(5, passOrNotPass);
	        preparedStatement.setString(6, review);
	        preparedStatement.setString(7, id);
	        preparedStatement.executeUpdate();
	        preparedStatement.close();
	        conn.close();
	        response.sendRedirect(request.getContextPath() + "/test2/showBackIndex");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	}

}
