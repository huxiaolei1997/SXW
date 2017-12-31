package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.XiangJuDao;
import entity.XiangJu;
import util.DBUtil;
import util.StringUtil;

/**
 * Servlet implementation class ShowLive
 */
@WebServlet("/ShowLive")
public class ShowLive extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowLive() {
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
		String pageNumStr = request.getParameter("pageNum");
		// System.out.print(commentType);
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		XiangJuDao xiangJudao = new XiangJuDao();
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "select count(*) from xiangju where display = '1'";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				totalPages = rs.getInt(1);
			}
			if (totalPages % 3 == 0 && totalPages != 0) {
				totalPage = totalPages / 3;
			} else if (totalPages % 3 == 0 && totalPages == 0) {
				totalPage = 1;
			} else {
				totalPage = totalPages / 3 + 1;
			}
			pageNum = pageNum > totalPage ? totalPage : pageNum;
			List<XiangJu> xiangJus = xiangJudao.queryPageXiangJus(pageNum);
			List<XiangJu> roomTitles = xiangJudao.queryRoomTitles();
			Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
			 request.setAttribute("result", xiangJus);
			 request.setAttribute("roomTitles", roomTitles);
			 request.setAttribute("totalPages", totalPages);
			 request.setAttribute("currentPage", currentPage);
			 request.getRequestDispatcher("live.jsp").forward(request,response);
			// System.out.print("success");
//			JSONArray jsonArray = new JSONArray();
//			for (XiangJu a : xiangJus) {
//				JSONObject jsonObject = new JSONObject();
//				jsonObject.put("id", a.getId());
//				jsonObject.put("roomTitle", a.getRoomTitle());
//				jsonObject.put("feature", a.getFeature());
//				jsonObject.put("imageUrl", a.getImageUrl());
//				jsonObject.put("price", a.getPrice());
//				jsonObject.put("addtime", a.getAddtime());
//				jsonObject.put("currentPage", currentPage);
//				jsonObject.put("totalPages", totalPages);
//				jsonArray.put(jsonObject);
		//	}
			//PrintWriter out = response.getWriter();
			// System.out.print(jsonArray);
			//out.print(jsonArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("查询总记录数失败！", e);
		}

	}

}
