package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.XiangJuDao;
import entity.XiangJu;
import util.DBUtil;
import util.StringUtil;

/**
 * Servlet implementation class PagerXiangJu
 */
@WebServlet("/PagerXiangJu")
public class PagerXiangJu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PagerXiangJu() {
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
		String keyword = request.getParameter("keyword");
		// System.out.print(commentType);
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if (keyword != null) {
			keyword = keyword.trim();
		}
		XiangJuDao xiangJuDao = new XiangJuDao();
		try {
			Connection conn = DBUtil.getConnection();
			// String sql = "select count(*) from users";
			StringBuilder cousqlBuilder = new StringBuilder("select count(*) from xiangju where 1=1");
			StringBuilder sqlBuilder = new StringBuilder("select * from xiangju where 1=1");
			if (keyword != null && !"".equals(keyword.trim())) {
				cousqlBuilder.append(
						" and (roomTitle like " + "'%" + keyword + "%'" + " or feature like " + "'%" + keyword + "%')");
				sqlBuilder.append(
						" and (roomTitle like " + "'%" + keyword + "%'" + " or feature like " + "'%" + keyword + "%')");
			}
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
			while (rs.next()) {
				totalPages = rs.getInt(1);
			}
			if (totalPages % 9 == 0 && totalPages != 0) {
				totalPage = totalPages / 9;
			} else if (totalPages % 9 == 0 && totalPages == 0) {
				totalPage = 1;
			} else {
				totalPage = totalPages / 9 + 1;
			}
			// pageNum = pageNum > totalPage ? totalPage : pageNum;
			// System.out.print(sqlBuilder.toString());
			// System.out.print(" " + totalPages + " ");
			List<XiangJu> xiangjus = xiangJuDao.queryAllXiangJus(pageNum, sqlBuilder.toString());
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
			request.setAttribute("result", xiangjus);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("keyword", keyword);
			request.getRequestDispatcher("xiangju.jsp").forward(request, response);
		} catch (Exception e) {
			throw new RuntimeException("查询结果失败", e);
		}
	}
}
