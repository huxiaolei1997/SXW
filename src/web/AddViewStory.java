package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import util.DBUtil;

/**
 * Servlet implementation class AddViewStory
 */
@WebServlet("/AddViewStory")
public class AddViewStory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddViewStory() {
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
		SmartUpload smartUpload = new SmartUpload(); // 新建一个SmartUpload对象
	    ServletConfig config = this.getServletConfig();
	    smartUpload.initialize(config,request,response);
		try {
		    smartUpload.upload();
			String title = smartUpload.getRequest().getParameter("title"); // 取title参数的值
			String introduction = smartUpload.getRequest().getParameter("introduction");
			String addtime = smartUpload.getRequest().getParameter("addtime");
			//String imageUrl = smartUpload.getRequest().getParameter("imageUrl");
			String content = smartUpload.getRequest().getParameter("content");
			String type = smartUpload.getRequest().getParameter("type");
			Date nowTime = new Date(System.currentTimeMillis());
			SimpleDateFormat sdFormatter = new SimpleDateFormat("HH:mm:ss");
			String time = sdFormatter.format(nowTime);
			addtime = addtime + " " + time;
			SimpleDateFormat sdFormatter1 = new SimpleDateFormat("yyyyMMddHHmmss");
			String addtime1 = sdFormatter1.format(nowTime);
			File smartFile = smartUpload.getFiles().getFile(0);
			String ext = smartUpload.getFiles().getFile(0).getFileExt();
			String fileName = "viewStoryimage" + addtime1 + (int) (Math.random() * 10000) + "." + ext;
			smartFile.saveAs("/upload/images/" + fileName, smartUpload.SAVE_VIRTUAL);
		    String imageUrl = "/upload/images/" + fileName;
			String path = request.getContextPath();
			HttpSession session = request.getSession();
			String user = (String) session.getAttribute("adminName");
			Connection conn = null;
			conn = DBUtil.getConnection();
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("insert into viewStory(viewTitle,user,introduction,content,browsingTimes,likes,imageUrl,addtime,type,display) values(?,?,?,?,?,?,?,?,?,?)");
				preparedStatement.setString(1, title);
				preparedStatement.setString(2, user);
				preparedStatement.setString(3, introduction);
				preparedStatement.setString(4, content);
				preparedStatement.setLong(5, 0);
				preparedStatement.setLong(6, 0);
				preparedStatement.setString(7, imageUrl);
				preparedStatement.setTimestamp(8, Timestamp.valueOf(addtime));
				preparedStatement.setString(9, type);
				preparedStatement.setString(10, "1");
				preparedStatement.executeUpdate();
				conn.close();
				response.sendRedirect(path + "/test2/pagerViewStory");
			} catch (Exception e) {
				// TODO: handle exception
				throw new RuntimeException("插入失败！",e);
			}
			//PrintWriter out = response.getWriter();
			//out.print(title + "," + introduction + "," + addtime + "," + imageUrl + "," + content);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("接收表单数据失败！", e);
		}
		// smartUpload.getRequest().getParameterValues(String name); //取数组值

	}

}
