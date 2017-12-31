package web;

import java.io.File;
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
 * Servlet implementation class DeleteXiangJu
 */
@WebServlet("/DeleteXiangJu")
public class DeleteXiangJu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteXiangJu() {
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
		String id = request.getParameter("id");
		String imageUrl = request.getParameter("imageUrl");
		Connection conn = null;
		conn = DBUtil.getConnection();
		try {
			

			//System.out.print(abpath);
			PreparedStatement preparedStatement = conn.prepareStatement("delete from xiangju where id = ?");
			preparedStatement.setString(1, id);
			preparedStatement.executeUpdate();
			String[] imageUrlStrings;
			imageUrlStrings = imageUrl.split(";");
			for(int i = 0 ; i < imageUrlStrings.length; i++){	
				//System.out.print(imageUrlStrings[i]);
				String abpath = getServletContext().getRealPath("/upload/images") + "/" + imageUrlStrings[i].substring(15);
				File file = new File(abpath);
				file.delete();
			}
			preparedStatement.close();
			conn.close();
			PrintWriter out = response.getWriter();
			out.print("success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("删除失败！", e);
		}
	}

}
