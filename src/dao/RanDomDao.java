package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Experience;
import entity.ViewStory;
import entity.XiangJu;
import util.DBUtil;

public class RanDomDao {
	public List<ViewStory> randomView() throws Exception {
		List<ViewStory> randomView = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "SELECT * FROM `viewStory` WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM `viewStory`)))  and type = 'view' ORDER BY id LIMIT 1;";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ViewStory view = new ViewStory();
			view.setId(rs.getLong("id"));
			view.setUser(rs.getString("user"));
			view.setViewTitle(rs.getString("viewTitle"));
			view.setIntroduction(rs.getString("introduction"));
			view.setContent(rs.getString("content"));
			view.setBrowsingTimes(rs.getLong("browsingTimes"));
			view.setLikes(rs.getLong("likes"));
			view.setImageUrl(rs.getString("imageUrl"));
			view.setAddtime(rs.getTimestamp("addtime"));
			view.setType(rs.getString("type"));
			randomView.add(view);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return randomView;

	}

	public List<ViewStory> randomStory() throws Exception {
		List<ViewStory> randomStory = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "SELECT * FROM `viewStory` WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM `viewStory`)))  and type='story' ORDER BY id LIMIT 1;";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ViewStory story = new ViewStory();
			story.setId(rs.getLong("id"));
			story.setUser(rs.getString("user"));
			story.setViewTitle(rs.getString("viewTitle"));
			story.setIntroduction(rs.getString("introduction"));
			story.setContent(rs.getString("content"));
			story.setBrowsingTimes(rs.getLong("browsingTimes"));
			story.setLikes(rs.getLong("likes"));
			story.setImageUrl(rs.getString("imageUrl"));
			story.setAddtime(rs.getTimestamp("addtime"));
			story.setType(rs.getString("type"));
			randomStory.add(story);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return randomStory;

	}

	public List<XiangJu> randomXiangJu() throws Exception {
		List<XiangJu> randomXiangJu = new ArrayList<XiangJu>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "SELECT * FROM `xiangju` WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM `xiangju`)))  ORDER BY id LIMIT 1;";
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
			randomXiangJu.add(xiangJu);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return randomXiangJu;
	}

	public List<Experience> randomExperience() throws Exception {
		List<Experience> randomExperience = new ArrayList<Experience>();
		Connection conn = DBUtil.getConnection();
		// Statement stat = conn.createStatement();
		String sql = "SELECT * FROM `experience` WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM `experience`)))  ORDER BY id LIMIT 1;";
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
			randomExperience.add(experience);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return randomExperience;

	}
}
