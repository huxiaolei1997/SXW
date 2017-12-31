package web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Multiset.Entry;

import dao.CommentDao;
import dao.ExperienceDao;
import dao.ShowSingleActivityDao;
import dao.TermDao;
import dao.userDao;
import entity.Comment;
import entity.Experience;
import entity.ShowComment;
import entity.User;
import entity.replyComment;
import util.StringUtil;

/**
 * Servlet implementation class ShowSingleActivityServlet
 */
@WebServlet("/ShowSingleActivityServlet")
public class ShowSingleActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowSingleActivityServlet() {
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
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String pageNumStr = request.getParameter("pageNum");
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
        ShowSingleActivityDao showSingleActivityDao = new ShowSingleActivityDao();
        TermDao termDao = new TermDao();
        CommentDao commentDao = new CommentDao();
        userDao userDao = new userDao();
		StringBuilder sqlBuilder = new StringBuilder("select * from experience where 1=1 and type='shortterm'");
		StringBuilder sqlBuilder2 = new StringBuilder("select * from experience where 1=1 and type='longterm'");
        try {
			List<Experience> singleExperience = showSingleActivityDao.querySingleExperiences(id);
			List<Experience> shortTerms = termDao.queryAllShortTerms(sqlBuilder.toString());
			List<Experience> longTerms = termDao.queryAllLongTerms(sqlBuilder2.toString());
			Integer countComments = commentDao.countComments(id, type);
			List<ShowComment> comments = commentDao.queryComments(id,type,pageNum);// 查询父评论，每页五条数据
			replyComment replyComment = null;
			User user = null;
			for(ShowComment showComment : comments){
			 replyComment = commentDao.findReplyComment(showComment.getContentId(), type);
			 //System.out.println(replyComment.getReplyCommentUserName());
			 user = userDao.findUser(replyComment.getReplyCommentUserName());
			 showComment.setUser(user);
			 showComment.setReplyComment(replyComment);
			 //System.out.println(user);
			}
			if (countComments % 5 == 0 && countComments != 0) {
				totalPage = countComments / 5;
			} else if (countComments % 5 == 0 && countComments == 0) {
				totalPage = 1;
			} else {
				totalPage = countComments / 5 + 1;
			}
			Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
			//List<ShowComment> activityComments = commentDao.queryComments(id,type,1);
			//request.setAttribute("comments", activityComments);
			request.setAttribute("comments",comments);
			request.setAttribute("totalPages", countComments);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("shortterm", shortTerms);
			request.setAttribute("longterm", longTerms);
			request.setAttribute("singleExperience", singleExperience);
			request.getRequestDispatcher("showActivity.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
