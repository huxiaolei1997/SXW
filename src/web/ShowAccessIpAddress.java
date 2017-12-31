package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IpAddressDao;
import entity.IpAddress;
import util.DBUtil;
import util.StringUtil;

/**
 * Servlet implementation class ShowAccessIpAddress
 */
@WebServlet("/ShowAccessIpAddress")
public class ShowAccessIpAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAccessIpAddress() {
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
		String pageNumStr = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		//System.out.print(commentType);
		String Type = "0";//默认显示全部
		Integer pageNum = 1; // 默认显示第几页数据
		Integer totalPages = 0; // 默认总条数
		Integer totalPage = 1;// 默认总页数
		if (pageNumStr != null && !"".equals(pageNumStr.trim()) && StringUtil.isNum(pageNumStr)) {
			pageNum = Integer.parseInt(pageNumStr);
		}
		if(type  == null){		
			type = Type;
		}
		if(keyword != null){
			keyword = keyword.trim();
		}
	    IpAddressDao ipAddressDao = new IpAddressDao();
		try {
			Connection conn = DBUtil.getConnection();
			// String sql = "select count(*) from users";
			StringBuilder cousqlBuilder = new StringBuilder("");
			StringBuilder sqlBuilder = new StringBuilder("select * from ipaddress where 1=1");
			if(type.equals("0")){
					cousqlBuilder = new StringBuilder("select count(*) from ipaddress where 1=1");
		 			sqlBuilder = new StringBuilder("select * from ipaddress where 1=1");
				if (keyword != null && !"".equals(keyword.trim())) {
					cousqlBuilder.append(" and (ipAddress like " + "'%" + keyword + "%'" + " or location like " + "'%" + keyword + "%'" + " or accessTime  like binary" + "'%" + keyword + "%')");
					sqlBuilder.append(" and (ipAddress like " + "'%" + keyword + "%'" + " or location like " + "'%" + keyword + "%'" + " or accessTime  like binary" + "'%" + keyword + "%')");
				}
				
			}
            if(type.equals("1")){   	
            	cousqlBuilder = new StringBuilder("select count(distinct ipAddress) from ipaddress where 1=1");
	 			sqlBuilder.append(" group by ipAddress");
			if (keyword != null && !"".equals(keyword.trim())) {
				sqlBuilder.setLength(0);
				cousqlBuilder.append(" and (ipAddress like " + "'%" + keyword + "%'" + " or location like " + "'%" + keyword + "%'" + " or accessTime like binary " + "'%" + keyword + "%')");
				sqlBuilder.append("select * from ipaddress where 1=1 and (ipAddress like " + "'%" + keyword + "%'" + " or location like " + "'%" + keyword + "%'" + " or accessTime like binary " + "'%" + keyword + "%') group by ipAddress ");
			}
            }
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(cousqlBuilder.toString());
			while (rs.next()) {
				totalPages = rs.getInt(1);
			}
			if (totalPages % 10 == 0 && totalPages != 0) {
				totalPage = totalPages / 10;
			} else if (totalPages % 10 == 0 && totalPages == 0) {
				totalPage = 1;
			} else {
				totalPage = totalPages / 10 + 1;
			}
			//pageNum = pageNum > totalPage ? totalPage : pageNum;
			// System.out.print(sqlBuilder.toString());
			// System.out.print(" " + totalPages + " ");
			List<IpAddress> ipAddresses = ipAddressDao.showIpAddress(pageNum, sqlBuilder.toString());
			// for(int i = 0; i < users.size(); i++){
			// User user = users.get(i);
			// System.out.print(user.getId());
			// }
			Integer currentPage = totalPage < pageNum ? totalPage : pageNum;
			// System.out.print(totalPages);
			// System.out.print(currentPage);
			// System.out.print(keyword);
			rs.close();
			stat.close();
			conn.close();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar c = Calendar.getInstance();
	        //过去七天
	        List<String> countIpAddress = null;
	        String[] sevenDays = new String[7]; 
	        for(int i = 0; i < sevenDays.length; i++){
				//c.set(2017,02,01); //设定自己需要的时间
	        	c.setTime(new Date());
	        	c.add(Calendar.DATE, - i);
	             Date d = c.getTime();
	             String day = format.format(d);
	            //System.out.println("过去七天："+day);
	             countIpAddress =  ipAddressDao.countIpAddress(day);
	             sevenDays[i] = "'" + day.substring(5) + "'";
	        }
	       //System.out.println(java.util.Arrays.toString(sevenDays));
	        //System.out.print(countIpAddress.toString());
	        request.setAttribute("data", java.util.Arrays.toString(sevenDays));
	        request.setAttribute("data2", countIpAddress.toString());
			request.setAttribute("result", ipAddresses);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("type", type);
			request.setAttribute("keyword", keyword);
			request.getRequestDispatcher("countIp.jsp").forward(request, response);
		} catch (Exception e) {
			throw new RuntimeException("查询结果失败", e);
		}
	}

}
