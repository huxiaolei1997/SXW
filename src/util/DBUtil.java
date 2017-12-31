package util;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.sql.Connection;

public class DBUtil {
		// 表示定义数据库的用户名
		private static String USERNAME ;

		// 定义数据库的密码
		private static String PASSWORD;

		// 定义数据库的驱动信息
		private static String DRIVER;

		// 定义访问数据库的地址
		private static String URL;
		static{
			//加载数据库配置信息，并给相关的属性赋值
			loadConfig();
		}
		/**
		 * 加载数据库配置信息，并给相关的属性赋值
		 */
		public static void loadConfig() {
			try {
				InputStream inStream = DBUtil.class.getResourceAsStream("/jdbc.properties");
				Properties prop = new Properties();
				prop.load(inStream);
				USERNAME = prop.getProperty("jdbc.username");
				PASSWORD = prop.getProperty("jdbc.password");
				DRIVER= prop.getProperty("jdbc.driver");
				URL = prop.getProperty("jdbc.url");
			} catch (Exception e) {
				throw new RuntimeException("读取数据库配置文件异常！", e);
			}
		}
 public static Connection getConnection(){
	 Connection conn = null;
	 try {
		 Class.forName(DRIVER);
		 conn = DriverManager.getConnection(URL + "?useUnicode=true&characterEncodingp=utf-8",USERNAME,PASSWORD);
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 return conn;
 }
 public static void close(Connection conn){
	 if(conn!=null){
		 try{
		 conn.close();
	 } catch (SQLException e){
		 e.printStackTrace();
	 }
 }
 }
}
