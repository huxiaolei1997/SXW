package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
 * Servlet implementation class UpdateHeadImage
 */
@WebServlet("/UpdateHeadImage")
public class UpdateHeadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHeadImage() {
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
		SmartUpload smartUpload = new SmartUpload();
		ServletConfig config = this.getServletConfig();
		smartUpload.initialize(config, request, response);
		smartUpload.setAllowedFilesList("png,jpg,jpeg,gif,bmp");
		try {
			smartUpload.setDeniedFilesList("rar,jsp,js,php,jsp,aspx,asp,html,htm,exe,bat");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			throw new RuntimeException("非法文件！",e1);
		}
		try {
			smartUpload.upload();
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
				preparedStatement.close();
				conn.close();
				HttpSession session = request.getSession();
				session.setAttribute("HeadImageUrl", headImageUrl);
				String url = (String) session.getAttribute("url");
				response.sendRedirect(url);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("操作数据库失败！",e);
			}
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("文件上传失败！",e);
		}
	}

}
