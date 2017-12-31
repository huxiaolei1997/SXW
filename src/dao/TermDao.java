package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Experience;
import util.DBUtil;

public class TermDao {
	public List<Experience> queryAllShortTerms(String sqlBuilder) throws Exception {
		List<Experience> shortExperiences = new ArrayList<Experience>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " and type = 'shortterm' and display = '1' order by id desc limit 0,6";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Experience experience = new Experience();
			experience.setId(rs.getLong("id"));
			experience.setExperTitle(rs.getString("experTitle"));
			experience.setContent(rs.getString("content"));
			experience.setImageUrl(rs.getString("imageUrl"));
			experience.setAddtime(rs.getTimestamp("addtime"));
			experience.setType(rs.getString("type"));
			experience.setDisplay(rs.getString("display"));
			shortExperiences.add(experience);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return shortExperiences;
		
	}
//	public List<Experience> queryAllShortTerms2(String sqlBuilder) throws Exception {
//		List<Experience> shortExperiences2 = new ArrayList<Experience>();
//		Connection conn = DBUtil.getConnection();
//		//Statement stat = conn.createStatement();
//		String sql =  sqlBuilder + " and type = 'shortterm' order by id desc limit 3,3";
//		PreparedStatement preparedStatement = conn.prepareStatement(sql);
//		ResultSet rs = preparedStatement.executeQuery();
//		while (rs.next()) {
//			Experience experience = new Experience();
//			experience.setId(rs.getLong("id"));
//			experience.setExperTitle(rs.getString("experTitle"));
//			experience.setContent(rs.getString("content"));
//			experience.setImageUrl(rs.getString("imageUrl"));
//			experience.setAddtime(rs.getTimestamp("addtime"));
//			experience.setType(rs.getString("type"));
//			shortExperiences2.add(experience);
//		}
//		DBUtil.close(conn);
//		return shortExperiences2;
//		
//	}
	public List<Experience> queryAllLongTerms(String sqlBuilder) throws Exception {
		List<Experience> longExperiences = new ArrayList<Experience>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " and type = 'longterm' and display = '1' order by id desc limit 0,6";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Experience experience = new Experience();
			experience.setId(rs.getLong("id"));
			experience.setExperTitle(rs.getString("experTitle"));
			experience.setContent(rs.getString("content"));
			experience.setImageUrl(rs.getString("imageUrl"));
			experience.setAddtime(rs.getTimestamp("addtime"));
			experience.setType(rs.getString("type"));
			experience.setDisplay(rs.getString("display"));
			longExperiences.add(experience);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return longExperiences;
		
	}
	
}
