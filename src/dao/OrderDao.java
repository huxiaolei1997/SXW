package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.OrderActivity;
import entity.OrderXiangJu;
import util.DBUtil;

public class OrderDao {
	public List<OrderXiangJu> queryOrderXiangJus(Integer pageNum, String sqlBuilder) throws Exception {
		List<OrderXiangJu> orderXiangJus = new ArrayList<OrderXiangJu>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = sqlBuilder + " order by id desc limit " + (pageNum - 1) * 10 + "," + 10;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			OrderXiangJu orderXiangJu = new OrderXiangJu();
			orderXiangJu.setId(rs.getLong("id"));
			orderXiangJu.setUserName(rs.getString("userName"));
			orderXiangJu.setRealName(rs.getString("realName"));
			orderXiangJu.setPhoneNumber(rs.getLong("phoneNumber"));
			orderXiangJu.setHouseType(rs.getString("houseType"));
			orderXiangJu.setCheckInDate(rs.getString("checkInDate"));
			orderXiangJu.setCheckOutDate(rs.getString("checkOutDate"));
			orderXiangJu.setCheckInNumber(rs.getInt("checkInNumber"));
			orderXiangJu.setRequirement(rs.getString("requirement"));
			orderXiangJu.setReview(rs.getString("review"));
			orderXiangJu.setPassOrNotPass(rs.getString("passOrNotPass"));
			orderXiangJus.add(orderXiangJu);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return orderXiangJus;
	}
	public List<OrderActivity> queryOrderActivities(Integer pageNum, String sqlBuilder) throws Exception {
		List<OrderActivity> orderActivities = new ArrayList<OrderActivity>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = sqlBuilder + " order by id desc limit " + (pageNum - 1) * 10 + "," + 10;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
			//OrderXiangJu orderXiangJu = new OrderXiangJu();
			OrderActivity orderActivity = new OrderActivity();
			orderActivity.setId(rs.getLong("id"));
			orderActivity.setUserName(rs.getString("userName"));
			orderActivity.setRealName(rs.getString("realName"));
			orderActivity.setPhoneNumber(rs.getLong("phoneNumber"));
			orderActivity.setActivityType(rs.getString("activityType"));
			orderActivity.setCheckInDate(rs.getString("checkInDate"));
			orderActivity.setReview(rs.getString("review"));
			orderActivity.setPassOrNotPass(rs.getString("passOrNotPass"));
			orderActivities.add(orderActivity);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return orderActivities;
	}
	public String countActivity() throws Exception {
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String countActivity = "0";
		String sql = "select count(*) from orderActivity";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
	      countActivity = String.valueOf(rs.getInt(1));
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return countActivity;
	}
	public String countXiangJu() throws Exception {
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String countXiangJu = "0";
		String sql = "select count(*) from orderXiangJu";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			countXiangJu = String.valueOf(rs.getInt(1));
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return countXiangJu;
	}
	public String countReviewXiangJu() throws Exception {
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String countReviewXiangJu = "0";
		String sql = "select count(*) from orderXiangJu where review = '1'";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			countReviewXiangJu = String.valueOf(rs.getInt(1));
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return countReviewXiangJu;
	}
	public String countReviewActivity() throws Exception {
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String countReviewActivity = "0";
		String sql = "select count(*) from orderActivity where review = '1'";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			countReviewActivity = String.valueOf(rs.getInt(1));
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return countReviewActivity;
	}
}
