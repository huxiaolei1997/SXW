package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RanDomDao;
import entity.Experience;
import entity.ViewStory;
import entity.XiangJu;

/**
 * Servlet implementation class showIndex
 */
@WebServlet("/showIndex")
public class ShowIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowIndex() {
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
		
		RanDomDao ranDomDao = new RanDomDao();
		try {
			List<ViewStory> randomStory = ranDomDao.randomStory();
			List<XiangJu> randomXiangJu = ranDomDao.randomXiangJu();
			List<Experience> randomExperience = ranDomDao.randomExperience();
			List<ViewStory> randomView = ranDomDao.randomView();
			request.setAttribute("randomView", randomView);
			request.setAttribute("randomXiangJu", randomXiangJu);
			request.setAttribute("randomExperience", randomExperience);
			request.setAttribute("randomStory", randomStory);
			request.getRequestDispatcher("index.jsp").forward(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("查询结果失败！",e);
		}
		
	}

}
