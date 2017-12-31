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
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import util.DBUtil;

/**
 * Servlet implementation class AddXiangJu
 */
@WebServlet("/AddXiangJu")
public class AddXiangJu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddXiangJu() {
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
	    String imageUrl = "";
	    try {    	
			smartUpload.upload();
			String roomTitle = smartUpload.getRequest().getParameter("roomTitle"); // 取experTitle参数的值
			String feature = smartUpload.getRequest().getParameter("feature");
			//String imageUrl = smartUpload.getRequest().getParameter("imageUrl");
			String price = smartUpload.getRequest().getParameter("price");
			Date nowTime = new Date(System.currentTimeMillis());
			SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String addtime = sdFormatter.format(nowTime);
			for (int i = 0; i < smartUpload.getFiles().getCount(); i++) {
				SimpleDateFormat sdFormatter1 = new SimpleDateFormat("yyyyMMddHHmmss");
				String addtime1 = sdFormatter1.format(nowTime);
				File smartFile = smartUpload.getFiles().getFile(i);
				String ext = smartUpload.getFiles().getFile(i).getFileExt();
				String fileName = "xiangju" + addtime1 + (int) (Math.random() * 10000) + "." + ext;
				smartFile.saveAs("/upload/images/" + fileName, smartUpload.SAVE_VIRTUAL);
			    imageUrl += "/upload/images/" + fileName + ";";
			}
			Connection conn = null;
			conn = DBUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement("insert into xiangju(roomTitle,feature,imageUrl,price,addtime,display) values(?,?,?,?,?,?)");
			preparedStatement.setString(1, roomTitle);
			preparedStatement.setString(2, feature);
			preparedStatement.setString(3, imageUrl);
			preparedStatement.setString(4, price);
			preparedStatement.setTimestamp(5, Timestamp.valueOf(addtime));
			preparedStatement.setString(6, "1");
			preparedStatement.executeUpdate();
			conn.close();
			//HttpSession session = request.getSession();
			//String url = (String) session.getAttribute("url");
			response.sendRedirect(request.getContextPath() + "/test2/pagerXiangJu");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("操作失败！",e);
		}
		
	}

}
