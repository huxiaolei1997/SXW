package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDao;
import entity.User;
import util.DBUtil;
import util.StringUtil;

public class pagerUser extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumStr = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");
		String ifadmin = request.getParameter("ifadmin");
		Integer Ifadmin = 0;//默认显示 全部用户
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if (ifadmin != null && !"".equals(ifadmin.trim()) && StringUtil.isNum(ifadmin)) {
			Ifadmin = Integer.parseInt(ifadmin);
		}
		if(keyword != null){
			keyword = keyword.trim();
		}
		userDao userdao = new userDao();
		try {
			Connection conn = DBUtil.getConnection();
			// String sql = "select count(*) from users";
			StringBuilder cousqlBuilder = new StringBuilder("select count(*) from users where 1=1");
			StringBuilder sqlBuilder = new StringBuilder("select * from users where 1=1");
			if (ifadmin != null && !"".equals(ifadmin.trim()) && ifadmin.equals("1")) {
				cousqlBuilder.append(" and ifadmin = 0");
				sqlBuilder.append(" and ifadmin = 0");
			}
			if (ifadmin != null && !"".equals(ifadmin.trim()) && ifadmin.equals("2")) {
				cousqlBuilder.append(" and ifadmin = 1");
				sqlBuilder.append(" and ifadmin = 1");
			}
			if (keyword != null && !"".equals(keyword.trim())) {
				cousqlBuilder.append(" and (name like " + "'%" + keyword + "%'" + " or conninfo like " + "'%" + keyword + "%'" + " or introduce like " + "'%" + keyword +"%'" + " or id like " + "'%" + keyword + "%')");
				sqlBuilder.append(" and (name like " + "'%" + keyword + "%'" + " or conninfo like " + "'%" + keyword + "%'" + " or introduce like " + "'%" + keyword +"%'" + " or id like " + "'%" + keyword + "%')");
			}
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
			//pageNum = pageNum > totalPage ? totalPage : pageNum;
			// System.out.print(sqlBuilder.toString());
			// System.out.print(" " + totalPages + " ");
			List<User> users = userdao.queryAllUsers(pageNum, sqlBuilder.toString());
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
			request.setAttribute("result", users);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("ifadmin", Ifadmin);
			request.setAttribute("keyword", keyword);
			request.getRequestDispatcher("user.jsp").forward(request, response);
		} catch (Exception e) {
			throw new RuntimeException("查询结果失败", e);
		}
	}
}
