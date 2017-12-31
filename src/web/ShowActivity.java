package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.TermDao;
import entity.Experience;

/**
 * Servlet implementation class ShowActivity
 */
@WebServlet("/ShowActivity")
public class ShowActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowActivity() {
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
		String keyword = request.getParameter("keyword");
		if(keyword != null){
			keyword = keyword.trim();
		}
		TermDao termDao = new TermDao();
		try {
			StringBuilder sqlBuilder = new StringBuilder("select * from experience where 1=1");
			if (keyword != null && !"".equals(keyword.trim())) {
				//cousqlBuilder.append(" and (commentName like " + "'%" + keyword + "%'" + " or content like " + "'%" + keyword + "%'" + " or commentTime like binary " + "'%" + keyword + "%'" + " or commentId like " + "'%" + keyword + "%'" + " or id like " + "'%" + keyword + "%')");
				sqlBuilder.append(" and (experTitle like " + "'%" + keyword + "%'" + " or content like " + "'%" + keyword + "%')");
			}
			List<Experience> shortExperiences = termDao.queryAllShortTerms(sqlBuilder.toString());
			List<Experience>  longExperiences = termDao.queryAllLongTerms(sqlBuilder.toString());
			//List<Experience>  shortExperiences2 = termDao.queryAllShortTerms2(sqlBuilder.toString());
			
			//List<Experience> longExperiences = termDao.queryAllLongTerms();
			request.setAttribute("shortExperiences", shortExperiences);
			request.setAttribute("longExperiences", longExperiences);
			//request.setAttribute("shortExperiences2", shortExperiences2);
			request.setAttribute("keyword", keyword);
			//request.setAttribute("longExperiences", longExperiences);
			request.getRequestDispatcher("activity.jsp").forward(request, response);
		} catch (Exception e) {
			throw new RuntimeException("查询结果失败！", e);
		}
	}

}
