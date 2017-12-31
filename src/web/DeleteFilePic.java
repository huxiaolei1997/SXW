package web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteFilePic extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id = request.getParameterValues("id[]");
		String action = request.getParameter("action");
		String dir = request.getParameter("dir");
		String actionType = request.getParameter("actionType");
		HttpSession session = request.getSession();
		String url = (String) session.getAttribute("url");
		//System.out.print(dir + "," + actionType);
	if(action != null && action.equals("file") && url.indexOf("pageNum") > -1 && url.indexOf("action") == -1){
		url = url + "&action=file";
	}
	if(action != null && action.equals("file") && url.indexOf("pageNum") == -1 && url.indexOf("action") == -1){
		url = url + "?action=file";
	}
		PrintWriter out = response.getWriter();
		if(actionType != null && actionType.equals("images")){
			String abpath = getServletContext().getRealPath("/upload/images") + "/" + dir;
			File file = new File(abpath);
			if (file.exists()) {
				if (file.delete()) {
					out.print("success");

				} else {
					out.print("fail");

				}
			} else {
				out.print("No exist");

			}
		}
		if(actionType != null && actionType.equals("file")){
			String abpath = getServletContext().getRealPath("/upload/file") + "/" + dir;
			File file = new File(abpath);
			if (file.exists()) {
				if (file.delete()) {
					out.print("success");

				} else {
					out.print("fail");

				}
			} else {
				out.print("No exist");

			}
		}
		if (action != null && action.equals("images")) {
			for (int i = 0; i < id.length; i++) {
				String abpath = getServletContext().getRealPath("/upload/images") + "/" + id[i];
				File file = new File(abpath);
				if (file.exists()) {
					if (file.delete()) {
						out.print("true");

					} else {
						out.print("false");

					}
				} else {
					out.print("No exist");

				}
			}
			response.sendRedirect(url);
		}
		if (action != null && action.equals("file")) {
			for (int i = 0; i < id.length; i++) {
				String abpath = getServletContext().getRealPath("/upload/file") + "/" + id[i];
				File file = new File(abpath);
				if (file.exists()) {
					if (file.delete()) {
						out.print("true");

					} else {
						out.print("false");

					}
				} else {
					out.print("No exist");

				}
			}
			response.sendRedirect(url);
		}

	}
}
