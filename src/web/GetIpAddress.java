package web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IpAddressDao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetIpAddress
 */
@WebServlet("/GetIpAddress")
public class GetIpAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetIpAddress() {
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
		String ip = request.getHeader("x-forwarded-for");
		response.setContentType("text/html;charset=utf-8");
		// System.out.println("x-forwarded-for ip: " + ip);
		// out.print("x-forwarded-for ip: " + ip + "<br>");
		if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个ip值，第一个ip才是真实ip
			if (ip.indexOf(",") != -1) {
				ip = ip.split(",")[0];
			}
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
			// System.out.println("Proxy-Client-IP ip: " + ip);
			// out.print("Proxy-Client-IP ip: " + ip + "<br>");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			// System.out.println("WL-Proxy-Client-IP ip: " + ip);
			// out.print("WL-Proxy-Client-IP ip: " + ip + "<br>");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			// System.out.println("HTTP_CLIENT_IP ip: " + ip);
			// out.print("HTTP_CLIENT_IP ip: " + ip + "<br>");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			// System.out.println("HTTP_X_FORWARDED_FOR ip: " + ip);
			// out.print("HTTP_X_FORWARDED_FOR ip: " + ip + "<br>");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
			// System.out.println("X-Real-IP ip: " + ip);
			// out.print("X-Real-IP ip: " + ip + "<br>");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
			// System.out.println("getRemoteAddr ip: " + ip);
			// out.print("getRemoteAddr ip: " + ip + "<br>");
		}
		String address = "未分配或者内网IP---内网IP-内网IP-内网IP";
		if(ip.equals("0:0:0:0:0:0:0:1")){
			ip = "127.0.0.1";	
		}
	
		try {
			Date nowTime2 = new Date(System.currentTimeMillis());
			SimpleDateFormat sdFormatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String accessTime2 = sdFormatter2.format(nowTime2);
			IpAddressDao ipAddressDao2 = new IpAddressDao();
			ipAddressDao2.queryIpAddresses(ip, address, Timestamp.valueOf(accessTime2));
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
//		try {//通过get方式从淘宝ip地址库获取ip信息
//			URL U = new URL("http://ip.taobao.com/service/getIpInfo.php?ip=" + ip);
//			URLConnection connection = U.openConnection();
//			connection.connect();
//			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//			String result = "";
//			String line;
//			while ((line = in.readLine()) != null) {
//				result += line;
//				// System.out.print(line);
//			}
//			in.close();
//			JSONObject jsonObject = JSONObject.fromObject(result); // 把从淘宝ip地址库返回的信息转换成jsonObject类型
//			Map<String, Object> map = (Map) jsonObject;
//			String code = String.valueOf(map.get("code"));
//			if ("1".equals(code)) {
//				String data = String.valueOf(map.get("code")); //code=1表示返回ip信息失败，code=0表示返回信息成功
//				address = "未分配或者内网IP---内网IP-内网IP-内网IP";
//			} else if ("0".equals(code)) {
//				Map<String, Object> data = (Map<String, Object>) map.get("data");
//				String country = String.valueOf(data.get("country"));
//				String area = String.valueOf(data.get("area"));
//				String city = String.valueOf(data.get("city"));
//				String region = String.valueOf(data.get("region"));
//				String county = String.valueOf(data.get("county"));
//				String isp = String.valueOf(data.get("isp"));
//				address = country + "-" + area + "-" + region;
//			}
//			Date nowTime = new Date(System.currentTimeMillis());
//			SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String accessTime = sdFormatter.format(nowTime);
//			IpAddressDao ipAddressDao = new IpAddressDao();
//			ipAddressDao.queryIpAddresses(ip, address, Timestamp.valueOf(accessTime));
//		} catch (MalformedURLException e1) {
//			e1.printStackTrace();
//		} catch (Exception e) {
			// TODO: handle exception
//		}
	}

}
