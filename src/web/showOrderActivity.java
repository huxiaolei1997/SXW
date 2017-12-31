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

import dao.OrderDao;
import entity.OrderActivity;
import entity.OrderXiangJu;
import util.DBUtil;
import util.StringUtil;

/**
 * Servlet implementation class showOrderActivity
 */
@WebServlet("/showOrderActivity")
public class showOrderActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showOrderActivity() {
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
         if(path.equals("/showFrontOrderActivity")){
        	    response.setContentType("application/json;charset=utf-8");
 		        response.setHeader("Pragma", "No-cache");//设置页面不缓存
                response.setHeader("Cache-Control", "no-cache");
        		String pageNumStr = request.getParameter("pageNum");
        		// System.out.print(commentType);
        		Integer pageNum = 1; // 默认显示第几页数据
        		Integer totalPages = 0; // 默认总条数
        		Integer totalPage = 1;// 默认总页数
        		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
        			pageNum = Integer.parseInt(pageNumStr);
        		}
               OrderDao orderDao = new OrderDao();
        		try {
        			Connection conn = DBUtil.getConnection();
        			// String sql = "select count(*) from users";
        			HttpSession session = request.getSession();
        			String userName1 = (String) session.getAttribute("userName");
        			StringBuilder cousqlBuilder = new StringBuilder("select count(*) from orderActivity where 1=1 and userName = '" + userName1 + "'");	
        			StringBuilder sqlBuilder = new StringBuilder("select * from orderActivity where 1=1 and userName ='" + userName1 + "'");
        			Statement stat = conn.createStatement();
        			ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
        			while (rs.next()) {
        				totalPages = rs.getInt(1);
        			}
        			
        			if (totalPages % 10 == 0 && totalPages != 0) {
        				totalPage = totalPages / 10;
        			} else if (totalPages % 10 == 0 && totalPages == 0) {
        				totalPage = 1;
        			} else {
        				totalPage = totalPages / 10 + 1;
        			}
        			rs.close();
        			stat.close();
                    conn.close();
        			Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
                    List<OrderActivity> orderActivities = orderDao.queryOrderActivities(pageNum, sqlBuilder.toString());
        		   	  JSONArray jsonArray = new JSONArray();
                      for(OrderActivity a : orderActivities){
                      	JSONObject jsonObject = new JSONObject();
                      	jsonObject.put("id", a.getId());
                      	jsonObject.put("userName", a.getUserName());
                      	jsonObject.put("realName", a.getRealName());
                      	jsonObject.put("phoneNumber", a.getPhoneNumber());
                      	jsonObject.put("activityType", a.getActivityType());
                      	jsonObject.put("checkInDate", a.getCheckInDate());
                      	jsonObject.put("review",a.getReview());
                      	jsonObject.put("passOrNotPass", a.getPassOrNotPass());
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
		
          
		if(path.equals("/showOrderActivity")){
			String pageNumStr = request.getParameter("pageNum");
			// System.out.print(commentType);
			Integer pageNum = 1; // 默认显示第几页数据
			Integer totalPages = 0; // 默认总条数
			Integer totalPage = 1;// 默认总页数
			if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
	       OrderDao orderDao = new OrderDao();
			try {
				Connection conn = DBUtil.getConnection();
				// String sql = "select count(*) from users";
				StringBuilder cousqlBuilder = new StringBuilder("select count(*) from orderActivity where 1=1");	
				StringBuilder sqlBuilder = new StringBuilder("select * from orderActivity where 1=1");
				Statement stat = conn.createStatement();
				ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
				while (rs.next()) {
					totalPages = rs.getInt(1);
				}
				
				if (totalPages % 10 == 0 && totalPages != 0) {
					totalPage = totalPages / 10;
				} else if (totalPages % 10 == 0 && totalPages == 0) {
					totalPage = 1;
				} else {
					totalPage = totalPages / 10 + 1;
				}
				rs.close();
				stat.close();
	            conn.close();
				Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
	            List<OrderActivity> orderActivities = orderDao.queryOrderActivities(pageNum, sqlBuilder.toString());
	            String countXiangJu = orderDao.countXiangJu();
			    String countReviewActivity = orderDao.countReviewActivity();
			    String countReviewXiangJu = orderDao.countReviewXiangJu();
	            request.setAttribute("result", orderActivities);
	            request.setAttribute("countXiangJu", countXiangJu);
	            request.setAttribute("countReviewActivity",countReviewActivity);
	            request.setAttribute("countReviewXiangJu", countReviewXiangJu);
	            request.setAttribute("totalPages", totalPages);
				request.setAttribute("currentPage", currentPage);
				//request.setAttribute("keyword", keyword);
				//System.out.print("success");
				request.getRequestDispatcher("orderActivity.jsp").forward(request, response);
			} catch (Exception e) {
				throw new RuntimeException("查询结果失败", e);
			} 
			
		}

	}

}
