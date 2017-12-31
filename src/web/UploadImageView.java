package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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

import util.DBUtil;;

/**
 * Servlet implementation class UploadImageView
 */
@WebServlet("/UploadImageView")
public class UploadImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImageView() {
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
		SmartUpload smartUpload = new SmartUpload();
		ServletConfig config = this.getServletConfig();
		smartUpload.initialize(config, request, response);
		smartUpload.setAllowedFilesList("png,jpg,jpeg,gif,bmp");// 设置允许上传的图片类型
		try {
			smartUpload.setDeniedFilesList("rar,jsp,js,php,jsp,aspx,asp,html,htm,exe,bat");
			smartUpload.upload();
			
			// System.out.print("/upload/images/" + fileName);
			PrintWriter out = response.getWriter();
			// HttpSession session = request.getSession();
			/**
			 * 下面的代码判断上传文件的个数，然后再执行相应的方法
			 */
			if(smartUpload.getFiles().getCount() == 1){
				String id = smartUpload.getRequest().getParameter("id");
				File smartFile = smartUpload.getFiles().getFile(0);
				String ext = smartUpload.getFiles().getFile(0).getFileExt();
				String fileName = "headImage" + id + "." + ext;
				smartFile.saveAs("/upload/headImages/" + fileName, smartUpload.SAVE_VIRTUAL);
			    String headImageUrl = "/upload/headImages/" + fileName + "?t=" + (int)(Math.random()*1000000000);
			    Connection conn = DBUtil.getConnection();
			    try {
					PreparedStatement preparedStatement = conn.prepareStatement("update users set headImageUrl = ? where id = ?");
					preparedStatement.setString(1, headImageUrl);
					preparedStatement.setString(2, id);
					preparedStatement.executeUpdate();
					String path = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
					if(path.equals("/upload")){
						HttpSession session = request.getSession();
						session.setAttribute("HeadImageUrl", headImageUrl);
					}
					preparedStatement.close();
					conn.close();
	                out.print(headImageUrl);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("操作数据库失败！",e);
				}
			} else {
				for (int i = 0; i < smartUpload.getFiles().getCount(); i++) {
					String imageUrl = "";	
					File smartFile = smartUpload.getFiles().getFile(i);
					String ext = smartUpload.getFiles().getFile(i).getFileExt();
					Date nowTime = new Date(System.currentTimeMillis());
					SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String time = sdFormatter.format(nowTime);
					String fileName = "viewStoryimage" + time + (int) (Math.random() * 10000) + "." + ext;
					smartFile.saveAs("/upload/images/" + fileName, smartUpload.SAVE_VIRTUAL);
				    imageUrl +=  "/upload/images/" + fileName + ";";
				    out.print(imageUrl);
				}	
			}
			//System.out.print(imageUrl);
			// session.setAttribute("imageUrl", imageUrl);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.print("fail");
			throw new RuntimeException("上传图片失败", e);
		}

	}

}
