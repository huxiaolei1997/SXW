package web;

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtil;

public class GetFileName extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumStr = request.getParameter("pageNum");
		String action = "images";
		Integer pageNum = 1; // 默认当前页
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1; // 默认总页数
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if (action != null && action.equals("images")) {
			String abpath = getServletContext().getRealPath("/upload/images");
			File file = new File(abpath);
			PrintWriter out = response.getWriter();
			// out.print(abpath);
			// String[] test = file.list();
			// for(int i=0;i<test.length;i++)
			// {
			// out.print(test[i]);
			// }
			ArrayList<String> directory = new ArrayList<String>();
			File[] fileList = file.listFiles();
			for (int i = 0; i < fileList.length; i++) {
				if (fileList[i].isFile()) {
					String fileName = fileList[i].getName();
					out.print("文件：" + fileName);
					directory.add(fileName);
				}
				if (fileList[i].isDirectory()) {
					String fileName = fileList[i].getName();
					out.print("目录：" + fileName);

				}
			}
			totalPages = directory.size();
			if (totalPages % 10 == 0 && totalPages != 0) {
				totalPage = totalPages / 10;
			} else if (totalPages % 10 == 0 && totalPages == 0) {
				totalPage = 1;
			} else {
				totalPage = totalPages / 10 + 1;
			}
			pageNum = pageNum > totalPage ? totalPage : pageNum;
			int fromIndex = (pageNum - 1) * 10;
			int toIndex = pageNum * 10 > totalPages ? totalPages : pageNum * 10;
		    List<String>  directorysublist =   directory.subList(fromIndex, toIndex);
		    request.setAttribute("totalPages", totalPages);
		    request.setAttribute("pageNum", pageNum);
			request.setAttribute("directory", directorysublist);
			request.setAttribute("action", action);
			request.getRequestDispatcher("/test2/images.jsp").forward(request, response);
		}
		if (action != null && action.equals("file")) {
			String abpath = getServletContext().getRealPath("/upload/file");
			File file = new File(abpath);
			PrintWriter out = response.getWriter();
			// out.print(abpath);
			// String[] test = file.list();
			// for(int i=0;i<test.length;i++)
			// {
			// out.print(test[i]);
			// }
			ArrayList<String> directory = new ArrayList<String>();
			File[] fileList = file.listFiles();
			for (int i = 0; i < fileList.length; i++) {
				if (fileList[i].isFile()) {
					String fileName = fileList[i].getName();
					out.print("文件：" + fileName);
					directory.add(fileName);
				}
				if (fileList[i].isDirectory()) {
					String fileName = fileList[i].getName();
					out.print("目录：" + fileName);

				}
			}
			totalPages = directory.size();
			if (totalPages % 10 == 0 && totalPages != 0) {
				totalPage = totalPages / 10;
			} else if (totalPages % 10 == 0 && totalPages == 0) {
				totalPage = 1;
			} else {
				totalPage = totalPages / 10 + 1;
			}
			pageNum = pageNum > totalPage ? totalPage : pageNum;
			int fromIndex = (pageNum - 1) * 10;
			int toIndex = pageNum * 10 > totalPages ? totalPages : pageNum * 10;
		    List<String> directorysublist =   directory.subList(fromIndex, toIndex);
		    request.setAttribute("totalPages", totalPages);
		    request.setAttribute("pageNum", pageNum);
			request.setAttribute("directory", directorysublist);
			request.setAttribute("action", action);
			request.getRequestDispatcher("/test2/images.jsp").forward(request, response);
		}
	}
}
