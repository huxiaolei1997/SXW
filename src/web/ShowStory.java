package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.ViewStoryDao;
import entity.ViewStory;
import util.DBUtil;
import util.StringUtil;

/**
 * Servlet implementation class ShowStory
 */
@WebServlet("/ShowStory")
public class ShowStory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowStory() {
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
		String path = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		if(path.equals("/getStory")){
			String pageNumStr = request.getParameter("pageNum");
			//System.out.print(commentType);
			Integer pageNum = 1; // 默认显示第几页数据
			Integer totalPages = 0; // 默认总条数
			Integer totalPage = 1;// 默认总页数
			if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
			ViewStoryDao viewStoryDao = new ViewStoryDao();
			try {
				Connection conn = DBUtil.getConnection();
				// String sql = "select count(*) from users";
				HttpSession session = request.getSession();
				String userName = (String) session.getAttribute("userName");
				StringBuilder cousqlBuilder = new StringBuilder("select count(*) from viewStory where 1=1 and type='story' and user='" + userName + "'");
				StringBuilder sqlBuilder = new StringBuilder("select * from viewStory where 1=1 and user ='" + userName + "'");
				Statement stat = conn.createStatement();
				ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
				while (rs.next()) {
					totalPages = rs.getInt(1);
				}
				if (totalPages % 6 == 0 && totalPages != 0) {
					totalPage = totalPages / 6;
				} else if (totalPages % 6 == 0 && totalPages == 0) {
					totalPage = 1;
				} else {
					totalPage = totalPages / 6 + 1;
				}

				List<ViewStory> stories = viewStoryDao.queryAllStories(pageNum, sqlBuilder.toString());
				Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
				rs.close();
				stat.close();
				conn.close();
				JSONArray jsonArray = new JSONArray();
				for(ViewStory a : stories){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", a.getId());
					jsonObject.put("user", a.getUser());
					jsonObject.put("viewTitle",a.getViewTitle());
					jsonObject.put("introduction", a.getIntroduction());
					jsonObject.put("content", a.getContent());
					jsonObject.put("browsingTimes", a.getBrowsingTimes());
					jsonObject.put("likes", a.getLikes());
					jsonObject.put("imageUrl", a.getImageUrl());
					jsonObject.put("addtime", a.getAddtime());
					jsonObject.put("type", a.getType());
					jsonObject.put("totalPages", totalPages);
					jsonObject.put("currentPage", currentPage);
					jsonArray.put(jsonObject);
				}
				PrintWriter out = response.getWriter();
				out.print(jsonArray);
			} catch (Exception e) {
				throw new RuntimeException("查询结果失败", e);
			}
			
		}
		
		if(path.equals("/showStory")){
			String pageNumStr = request.getParameter("pageNum");
			//System.out.print(commentType);
			Integer pageNum = 1; // 默认显示第几页数据
			Integer totalPages = 0; // 默认总条数
			Integer totalPage = 1;// 默认总页数
			if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
			ViewStoryDao viewStoryDao = new ViewStoryDao();
			try {
				Connection conn = DBUtil.getConnection();
				// String sql = "select count(*) from users";
				StringBuilder cousqlBuilder = new StringBuilder("select count(*) from viewStory where 1=1 and type='story' and display = '1'");
				StringBuilder sqlBuilder = new StringBuilder("select * from viewStory where 1=1");
				Statement stat = conn.createStatement();
				ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
				while (rs.next()) {
					totalPages = rs.getInt(1);
				}
				if (totalPages % 6 == 0 && totalPages != 0) {
					totalPage = totalPages / 6;
				} else if (totalPages % 6 == 0 && totalPages == 0) {
					totalPage = 1;
				} else {
					totalPage = totalPages / 6 + 1;
				}
				pageNum = pageNum > totalPage ? totalPage : pageNum;
				// System.out.print(sqlBuilder.toString());
				// System.out.print(" " + totalPages + " ");
				List<ViewStory> stories = viewStoryDao.queryAllStories(pageNum, sqlBuilder.toString());
				// for(int i = 0; i < users.size(); i++){
				// User user = users.get(i);
				// System.out.print(user.getId());
				// }
				Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
				// System.out.print(totalPages);
				// System.out.print(currentPage);
				// System.out.print(keyword);
				rs.close();
				stat.close();
				conn.close();
				request.setAttribute("result", stories);
				request.setAttribute("totalPages", totalPages);
				request.setAttribute("currentPage", currentPage);
				request.getRequestDispatcher("story.jsp").forward(request, response);
			} catch (Exception e) {
				throw new RuntimeException("查询结果失败", e);
			}
		}
		
	}

}
