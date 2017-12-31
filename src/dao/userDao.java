package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import entity.User;
import util.DBUtil;

public class userDao {
	public List<User> queryAllUsers(Integer pageNum,String sqlBuilder) throws Exception {
		List<User> users = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " order by id desc limit " + (pageNum - 1) * 10 + "," + 10;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			User u = new User();
			u.setId(rs.getLong("id"));
			u.setName(rs.getString("name"));
			u.setHeadImageUrl(rs.getString("headImageUrl"));
			u.setSex(rs.getString("sex"));
			u.setPwd(rs.getString("pwd"));
			u.setConninfo(rs.getString("conninfo"));
			u.setIntroduce(rs.getString("introduce"));
			u.setIfadmin(rs.getString("ifadmin"));
			users.add(u);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return users;
		
	}
	public List<User> querySingleUsers(String name) throws Exception {
		List<User> users = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from users where name = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, name);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			User u = new User();
			u.setId(rs.getLong("id"));
			u.setName(rs.getString("name"));
			u.setHeadImageUrl(rs.getString("headImageUrl"));
			u.setSex(rs.getString("sex"));
			u.setPwd(rs.getString("pwd"));
			u.setConninfo(rs.getString("conninfo"));
			u.setIntroduce(rs.getString("introduce"));
			u.setIfadmin(rs.getString("ifadmin"));
			users.add(u);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return users;
		
	}

	public String queryUpdatePwd(String adminName, String oldPwd, String newPwd, HttpServletRequest request)
			throws Exception {
		// List<User> users = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "select count(*) from users where name = ? and pwd = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, adminName);
		preparedStatement.setString(2, oldPwd);
		String out = "";
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			if (rs.getInt(1) == 0) {
				out = "0";
			}
			if (rs.getInt(1) == 1) {
				String sql2 = "select pwd from users where name = ? and pwd = ?";
				PreparedStatement preparedStatement2 = conn.prepareStatement(sql2);
				preparedStatement2.setString(1, adminName);
				preparedStatement2.setString(2, oldPwd);
				ResultSet rs2 = preparedStatement2.executeQuery();
				while (rs2.next()) {
					if (rs2.getString(1).equals(newPwd)) {
						out = "1";
					}else{
						Connection connection = DBUtil.getConnection();
						String sql3 = "update users set pwd = ? where name = ?";
						PreparedStatement preparedStatement3 = connection.prepareStatement(sql3);
						preparedStatement3.setString(1, newPwd);
						preparedStatement3.setString(2, adminName);
						preparedStatement3.executeUpdate();
						HttpSession session = request.getSession();
						session.removeAttribute("adminName");
						out = "2";
					}
				}

			}

		}
		DBUtil.close(conn);
		return out;
	}
	public User findUser(String name) throws Exception {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from users where name = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, name);
		ResultSet rs = preparedStatement.executeQuery();
		User u = new User();
		while (rs.next()) {
			u.setId(rs.getLong("id"));
			u.setName(rs.getString("name"));
			u.setHeadImageUrl(rs.getString("headImageUrl"));
			u.setSex(rs.getString("sex"));
			u.setPwd(rs.getString("pwd"));
			u.setConninfo(rs.getString("conninfo"));
			u.setIntroduce(rs.getString("introduce"));
			u.setIfadmin(rs.getString("ifadmin"));
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return u;
		
	}
}
