package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Comment;
import entity.XiangJu;
import util.DBUtil;

public class XiangJuDao {
	public List<XiangJu> queryAllXiangJus(Integer pageNum, String sqlBuilder) throws Exception {
		List<XiangJu> xiangJus = new ArrayList<XiangJu>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = sqlBuilder + " order by id desc limit " + (pageNum - 1) * 9 + "," + 9;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			XiangJu xiangJu = new XiangJu();
			xiangJu.setId(rs.getLong("id"));
			xiangJu.setRoomTitle(rs.getString("roomTitle"));
			xiangJu.setFeature(rs.getString("feature"));
			xiangJu.setImageUrl(rs.getString("imageUrl"));
			xiangJu.setPrice(rs.getInt("price"));
			xiangJu.setAddtime(rs.getTimestamp("addtime"));
			xiangJu.setDisplay(rs.getString("display"));
			xiangJus.add(xiangJu);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return xiangJus;
	}
	public List<XiangJu> queryPageXiangJus(Integer pageNum) throws Exception {
		List<XiangJu> pageXiangJus = new ArrayList<XiangJu>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "select * from xiangju where display = '1' order by id desc limit " + (pageNum - 1) * 3 + "," + 3;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			XiangJu xiangJu = new XiangJu();
			xiangJu.setId(rs.getLong("id"));
			xiangJu.setRoomTitle(rs.getString("roomTitle"));
			xiangJu.setFeature(rs.getString("feature"));
			xiangJu.setImageUrl(rs.getString("imageUrl"));
			xiangJu.setPrice(rs.getInt("price"));
			xiangJu.setAddtime(rs.getTimestamp("addtime"));
			xiangJu.setDisplay(rs.getString("display"));
			pageXiangJus.add(xiangJu);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return pageXiangJus;
	}
	public List<XiangJu> queryRoomTitles() throws Exception {
		List<XiangJu> roomTitles = new ArrayList<XiangJu>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "select * from xiangju where display = '1' order by id desc";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			XiangJu xiangJu = new XiangJu();
			xiangJu.setId(rs.getLong("id"));
			xiangJu.setRoomTitle(rs.getString("roomTitle"));
			xiangJu.setFeature(rs.getString("feature"));
			xiangJu.setImageUrl(rs.getString("imageUrl"));
			xiangJu.setPrice(rs.getInt("price"));
			xiangJu.setAddtime(rs.getTimestamp("addtime"));
			xiangJu.setDisplay(rs.getString("display"));
			roomTitles.add(xiangJu);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return roomTitles;
	}
	public String showOrNotShow(String display,String id) throws Exception {
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String flag = "";
		String sql = "update xiangju set display = ? where id = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, display);
		preparedStatement.setString(2, id);
		preparedStatement.executeUpdate();
		flag = "success";
		preparedStatement.close();
		DBUtil.close(conn);
		return flag;
	}
}
