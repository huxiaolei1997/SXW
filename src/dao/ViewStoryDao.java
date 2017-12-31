package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.ViewStory;
import util.DBUtil;

public class ViewStoryDao {
	public List<ViewStory> queryAllViewStories(Integer pageNum,String sqlBuilder) throws Exception {
		List<ViewStory> viewStories = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " order by addtime desc limit " + (pageNum - 1) * 9 + "," + 9;
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
			viewStory.setDisplay(rs.getString("display"));
			viewStories.add(viewStory);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return viewStories;
		
	}
	public List<ViewStory> queryAllViews() throws Exception {
		List<ViewStory> views = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from viewStory where type='view' and display = '1' order by addtime desc limit 0,7";
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
			viewStory.setDisplay(rs.getString("display"));
			views.add(viewStory);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return views;
		
	}
	public List<ViewStory> queryAllStories(Integer pageNum,String sqlBuilder) throws Exception {
		List<ViewStory> stories = new ArrayList<ViewStory>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " and type='story' and display = '1' order by id desc limit " + (pageNum - 1) * 6 + "," + 6;
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
			viewStory.setDisplay(rs.getString("display"));
			stories.add(viewStory);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return stories;
	}
	public String showOrNotShow(String id,String display) throws Exception {
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String flag = "";
		String sql =  "update viewStory set display = ? where id = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1,display);
		preparedStatement.setString(2, id);
		preparedStatement.executeUpdate();
	    flag = "success";
		preparedStatement.close();
		DBUtil.close(conn);
		return flag;
		
	}
}
