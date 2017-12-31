<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setHeader("Content-Type", "text/html");
	String rootPath = application.getRealPath("/");
	String action = request.getParameter("action");
	String result = new ActionEnter(request, rootPath).exec();
	if (action != null && (action.equals("listfile") || action.equals("listimage"))) {
		 rootPath = rootPath.replace("\\", "/");
		//out.print(rootPath + "<br/>");
		result = result.replaceAll(rootPath, "../");//把返回路径中的物理路径替换为 '/sxw/'
		//result = "/sxw/" + result;
		//out.print(result);
	}
	out.write(result);
	//rootPath = rootPath.substring(rootPath.length()-4,rootPath.length());
	//out.write(new ActionEnter(request, rootPath).exec());
	//out.print(rootPath);
	//String rootPath = application.getRealPath( "/" );
	
	//out.write( new ActionEnter( request, rootPath ).exec() );
%>

