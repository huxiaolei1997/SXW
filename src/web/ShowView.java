package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ViewStoryDao;
import entity.ViewStory;

/**
 * Servlet implementation class showView
 */
@WebServlet("/showView")
public class ShowView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowView() {
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
		ViewStoryDao viewStoryDao = new ViewStoryDao();
		try {
			List<ViewStory> views = viewStoryDao.queryAllViews();
			request.setAttribute("views", views);
			
			//String url = request.getContextPath() + request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1) + "scenery.jsp";
			request.getRequestDispatcher("scenery.jsp").forward(request, response);
			//System.out.print(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("查询结果失败！", e);
		}

	}

}
