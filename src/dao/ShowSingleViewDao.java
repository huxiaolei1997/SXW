package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.ViewStory;
import util.DBUtil;

public class ShowSingleViewDao {
	public List<ViewStory> querySingleView(String id) throws Exception {
		List<ViewStory> singleView = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "select * from viewStory where id = " + id;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ViewStory viewStory = new ViewStory();
			viewStory.setId(rs.getLong("id"));
			viewStory.setUser(rs.getString("user"));
			viewStory.setViewTitle(rs.getString("viewTitle"));
			viewStory.setIntroduction(rs.getString("introduction"));
			viewStory.setContent(rs.getString("content"));
			viewStory.setBrowsingTimes(rs.getLong("browsingTimes"));
			viewStory.setLikes(rs.getLong("likes"));
			viewStory.setImageUrl(rs.getString("imageUrl"));
			viewStory.setAddtime(rs.getTimestamp("addtime"));
			viewStory.setType(rs.getString("type"));
			singleView.add(viewStory);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return singleView;

	}
}
