package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExperienceDao;
import dao.ViewStoryDao;
import dao.XiangJuDao;

/**
 * Servlet implementation class ShowOrNotShow
 */
@WebServlet("/ShowOrNotShow")
public class ShowOrNotShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowOrNotShow() {
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
		String display = request.getParameter("display");
		String updateType = request.getParameter("updateType");
		PrintWriter out = response.getWriter();
		if(updateType.equals("viewStory")){
			ViewStoryDao viewStoryDao = new ViewStoryDao();
			try {
				String flag = viewStoryDao.showOrNotShow(id, display);
				out.print(flag);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(updateType.equals("xiangju")){
			XiangJuDao xiangJuDao = new XiangJuDao();
			try {
				String flag = xiangJuDao.showOrNotShow(display, id);
				out.print(flag);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		if(updateType.equals("experience")){
			ExperienceDao experienceDao = new ExperienceDao();
			try {
				String flag = experienceDao.showOrNotShow(id, display);
				out.print(flag);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
	}

}
