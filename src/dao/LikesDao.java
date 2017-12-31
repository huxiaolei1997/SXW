package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class LikesDao {
	public void addLikes(String viewStory_id) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("update viewStory set likes = likes + 1 where id = ?");
		preparedStatement.setString(1, viewStory_id);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void addLikesRecords(String viewStory_id, String userName) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("insert into likes(viewStory_id,userName) values(?,?)");
		preparedStatement.setString(1, viewStory_id);
		preparedStatement.setString(2, userName);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void reduceLikes(String viewStory_id) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("update viewStory set likes = likes - 1 where id = ?");
		preparedStatement.setString(1, viewStory_id);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void reduceLikesRecords(String viewStory_id, String userName) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("delete from likes  where viewStory_id = ? and userName = ?");
		preparedStatement.setString(1, viewStory_id);
		preparedStatement.setString(2, userName);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}
	public void addExperienceLikes(String experience_id) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("update experience set likes = likes + 1 where id = ?");
		preparedStatement.setString(1, experience_id);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void addExperienceLikesRecords(String experience_id, String userName) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("insert into experienceLikes(experience_id,userName) values(?,?)");
		preparedStatement.setString(1, experience_id);
		preparedStatement.setString(2, userName);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void reduceExperienceLikes(String experience_id) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("update experience set likes = likes - 1 where id = ?");
		preparedStatement.setString(1, experience_id);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}

	public void reduceExperienceLikesRecords(String experience_id, String userName) throws Exception {
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement("delete from experienceLikes  where experience_id = ? and userName = ?");
		preparedStatement.setString(1, experience_id);
		preparedStatement.setString(2, userName);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();
	}
}
