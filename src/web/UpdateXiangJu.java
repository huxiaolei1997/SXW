package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * Servlet implementation class UpdateXiangJu
 */
@WebServlet("/UpdateXiangJu")
public class UpdateXiangJu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateXiangJu() {
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
		String id = request.getParameter("id");
		Connection conn = null;
		conn = DBUtil.getConnection();
		if (id != null) {
			try {
				PreparedStatement preparedStatement = conn.prepareStatement("select * from xiangju where id = ?");
				preparedStatement.setString(1, id);
				preparedStatement.executeQuery();
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					// ServletContext application = this.getServletContext();
					HttpSession session = request.getSession();
					session.setAttribute("id", resultSet.getLong("id"));
					session.setAttribute("roomTitle", resultSet.getString("roomTitle"));
					session.setAttribute("feature", resultSet.getString("feature"));
					session.setAttribute("imageUrl", resultSet.getString("imageUrl"));
					session.setAttribute("price", resultSet.getLong("price"));
					response.sendRedirect(request.getContextPath() + "/test2/UpdateXiangJu.jsp");
					// request.getRequestDispatcher("/sxw/test2/addViewStory.jsp").forward(request,
					// response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("查询失败！", e);
			}
		} else if(id == null){
			SmartUpload smartUpload = new SmartUpload(); // 新建一个SmartUpload对象
			ServletConfig config = this.getServletConfig();
			smartUpload.initialize(config, request, response);
			try {
				smartUpload.upload();
				String updateId = smartUpload.getRequest().getParameter("updateId");
				String roomTitle= smartUpload.getRequest().getParameter("roomTitle");
				String feature = smartUpload.getRequest().getParameter("feature");
				String imageUrl = smartUpload.getRequest().getParameter("imageUrl");
				String price = smartUpload.getRequest().getParameter("price");
				//System.out.print(imageUrl.length() + "," + updateId);
				if(imageUrl.length() == 0){
					for (int i = 0; i < smartUpload.getFiles().getCount(); i++) {
						Date nowTime = new Date(System.currentTimeMillis());
						SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyyMMddHHmmss");
						String addtime = sdFormatter.format(nowTime);
						File smartFile = smartUpload.getFiles().getFile(i);
						String ext = smartUpload.getFiles().getFile(i).getFileExt();
						String fileName = "xiangju" + addtime + (int) (Math.random() * 10000) + "." + ext;
						smartFile.saveAs("/upload/images/" + fileName, smartUpload.SAVE_VIRTUAL);
					    imageUrl += "/upload/images/" + fileName + ";";
					}
				}	
				if (updateId != null) {
					PreparedStatement preparedStatement;
					try {
                        HttpSession session = request.getSession();
                        String url = (String) session.getAttribute("url");
						preparedStatement = conn.prepareStatement(
								"update  xiangju set roomTitle = ?, feature = ?, imageUrl = ?,price = ? where id = ?");
						preparedStatement.setString(1, roomTitle);
						preparedStatement.setString(2, feature);
						preparedStatement.setString(3, imageUrl);
						preparedStatement.setString(4, price);
						preparedStatement.setString(5, updateId);
						preparedStatement.executeUpdate();
						preparedStatement.close();
						conn.close();
						response.sendRedirect(request.getContextPath() + "/test2/pagerXiangJu");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						throw new RuntimeException("操作失败！",e);
					}

				}

			} catch (SmartUploadException e1) {
				// TODO Auto-generated catch block
			throw new RuntimeException("文件上传失败！",e1);
			}

		}
	}

}
