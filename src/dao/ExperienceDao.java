package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Experience;
import util.DBUtil;

public class ExperienceDao {
	public List<Experience> queryAllViewExperiences(Integer pageNum,String sqlBuilder) throws Exception {
		List<Experience> experiences = new ArrayList<Experience>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " order by id desc limit " + (pageNum - 1) * 9 + "," + 9;
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
			experience.setBrowsingTimes(rs.getString("browsingTimes"));
			experience.setLikes(rs.getString("likes"));
			experiences.add(experience);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return experiences;
		
	}
	public String showOrNotShow(String id,String display) throws Exception {
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String flag = "";
		String sql =  "update experience set display = ? where id = ?";
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
