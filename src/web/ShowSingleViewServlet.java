package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.RanDomDao;
import dao.ShowSingleViewDao;
import dao.userDao;
import entity.Experience;
import entity.ShowComment;
import entity.User;
import entity.ViewStory;
import entity.XiangJu;
import entity.replyComment;
import util.StringUtil;


/**
 * Servlet implementation class ShowSingleViewServlet
 */
@WebServlet("/ShowSingleViewServlet")
public class ShowSingleViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowSingleViewServlet() {
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
		ShowSingleViewDao showSingleViewDao = new ShowSingleViewDao();
		RanDomDao ranDomDao = new RanDomDao();
		CommentDao commentDao = new CommentDao();
		userDao userDao = new userDao();
		//buildComment buildComment = new buildComment();
		try {
			List<ViewStory> view = showSingleViewDao.querySingleView(id);
			Integer countComments = commentDao.countComments(id, type);
			List<ShowComment> comments = commentDao.queryComments(id,type,pageNum);// 查询父评论，每页五条数据
			//List<showComment2> showComment2s = commentDao.showComments(id, type);
			//List<Comment2> comment = buildComment.findCommentById(id, 1, type);
			List<ViewStory> randomView = ranDomDao.randomView();
			List<ViewStory> randomStory = ranDomDao.randomStory();
			List<Experience> randomExperience = ranDomDao.randomExperience();
			List<XiangJu> randomXiangJu = ranDomDao.randomXiangJu();
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
			request.setAttribute("view", view);
			request.setAttribute("comments",comments);
			request.setAttribute("totalPages", countComments);
			request.setAttribute("currentPage", currentPage);
			//System.out.print(comments.size());
			request.setAttribute("randomView", randomView);
			request.setAttribute("randomStory", randomStory);
			request.setAttribute("randomExperience", randomExperience);
			request.setAttribute("randomXiangJu", randomXiangJu);
			//request.setAttribute("comment", comment);
			request.getRequestDispatcher("showView.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
