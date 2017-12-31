package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Experience;
import util.DBUtil;

public class ShowSingleActivityDao {
	public List<Experience> querySingleExperiences(String id) throws Exception {
		List<Experience> singleExperience = new ArrayList<Experience>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from experience where id = " + id;
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
			experience.setBrowsingTimes(rs.getString("browsingTimes"));
			experience.setLikes(rs.getString("likes"));
			singleExperience.add(experience);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return singleExperience;
		
	}
}
