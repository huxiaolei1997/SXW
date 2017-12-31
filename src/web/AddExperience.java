package web;

import java.io.IOException;
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

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import util.DBUtil;

/**
 * Servlet implementation class AddExperience
 */
@WebServlet("/AddExperience")
public class AddExperience extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExperience() {
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
		SmartUpload smartUpload = new SmartUpload(); // 新建一个SmartUpload对象
	    ServletConfig config = this.getServletConfig();
	    smartUpload.initialize(config,request,response);
		try {
		    smartUpload.upload();
			String experTitle = smartUpload.getRequest().getParameter("experTitle"); // 取experTitle参数的值
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
			String fileName = "experience" + addtime1 + (int) (Math.random() * 10000) + "." + ext;
			smartFile.saveAs("/upload/images/" + fileName, smartUpload.SAVE_VIRTUAL);
		    String imageUrl = "/upload/images/" + fileName;
			String path = request.getContextPath();
			Connection conn = null;
			conn = DBUtil.getConnection();
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("insert into experience(experTitle,content,imageUrl,addtime,type,display) values(?,?,?,?,?,?)");
				preparedStatement.setString(1, experTitle);
				preparedStatement.setString(2, content);
				preparedStatement.setString(3, imageUrl);
				preparedStatement.setTimestamp(4, Timestamp.valueOf(addtime));
				preparedStatement.setString(5, type);
				preparedStatement.setString(6, "1");
				preparedStatement.executeUpdate();
				conn.close();
				response.sendRedirect(path + "/test2/pagerExperience");
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
