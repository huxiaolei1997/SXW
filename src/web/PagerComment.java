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

import dao.CommentDao;
import entity.Comment;
import util.DBUtil;
import util.StringUtil;

public class PagerComment extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumStr = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");
		String commentType = request.getParameter("commentType");
		//System.out.print(commentType);
		String CommentType = "all";//默认显示 全部用户
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if(commentType  == null){		
			commentType = CommentType;
		}
		if(keyword != null){
			keyword = keyword.trim();
		}
		CommentDao commentDao = new CommentDao();
		try {
			Connection conn = DBUtil.getConnection();
			// String sql = "select count(*) from users";
			StringBuilder cousqlBuilder = new StringBuilder("select count(*) from comment where 1=1");
			StringBuilder sqlBuilder = new StringBuilder("select * from comment where 1=1");
			if (commentType != null && !"".equals(commentType.trim()) && commentType.equals("story")) {
				cousqlBuilder.append(" and commentType = 'story'");
				sqlBuilder.append(" and commentType = 'story'");
			}
			if (commentType != null && !"".equals(commentType.trim()) && commentType.equals("view")) {
				cousqlBuilder.append(" and commentType = 'view'");
				sqlBuilder.append(" and commentType = 'view'");
			}
			if (commentType != null && !"".equals(commentType.trim()) && commentType.equals("experience")) {
				cousqlBuilder.append(" and commentType = 'experience'");
				sqlBuilder.append(" and commentType = 'experience'");
			}
			if (keyword != null && !"".equals(keyword.trim())) {
				cousqlBuilder.append(" and (commentName like " + "'%" + keyword + "%'" + " or content like " + "'%" + keyword + "%'" + " or commentTime like binary " + "'%" + keyword + "%'" + " or commentId like " + "'%" + keyword + "%'" + " or id like " + "'%" + keyword + "%')");
				sqlBuilder.append(" and (commentName like " + "'%" + keyword + "%'" + " or content like " + "'%" + keyword + "%'" + " or commentTime like binary " + "'%" + keyword + "%'" + " or commentId like " + "'%" + keyword + "%'" + " or id like " + "'%" + keyword + "%')");
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
			List<Comment> comments = commentDao.queryAllComments(pageNum, sqlBuilder.toString());
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
			request.setAttribute("result", comments);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("commentType", commentType);
			request.setAttribute("keyword", keyword);
			request.getRequestDispatcher("comment.jsp").forward(request, response);
		} catch (Exception e) {
			throw new RuntimeException("查询结果失败", e);
		}
	}
}
