package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;

import entity.Comment;
import entity.ShowComment;
import entity.replyComment;
import entity.showComment2;
import util.DBUtil;

public class CommentDao {
	public List<Comment> queryAllComments(Integer pageNum,String sqlBuilder) throws Exception {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  sqlBuilder + " order by id desc limit " + (pageNum - 1) * 10 + "," + 10;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setId(rs.getLong("id"));
			comment.setCommentName(rs.getString("commentName"));
			comment.setContent(rs.getString("content"));
			comment.setCommentTime(rs.getTimestamp("commentTime"));
			comment.setCommentId(rs.getLong("commentId"));
			comment.setCommentType(rs.getString("commentType"));
			comment.setState(rs.getString("state"));
			comments.add(comment);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return comments;
		
	}
	public List<ShowComment> queryComments(String id,String type,Integer pageNum) throws Exception {
		List<ShowComment> showComments = new ArrayList<ShowComment>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql = "select a.commentTime,a.commentName,a.id contentId,a.content,b.headImageUrl,b.id from comment a, users b where a.commentName = b.name  and commentId = ? and commentType = ? and a.state = 1 order by a.commentTime desc limit "  + (pageNum - 1) * 5 + "," + 5;
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, type);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ShowComment showComment = new ShowComment();
			showComment.setCommentName(rs.getString("commentName"));
			showComment.setContentId(rs.getString("contentId"));
			showComment.setContent(rs.getString("content"));
			showComment.setCommentTime(rs.getTimestamp("commentTime"));
			showComment.setHeadImageUrl(rs.getString("headImageUrl"));
			showComment.setUserId(rs.getLong("id"));
			showComments.add(showComment);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return showComments;
	}
	public List<Comment> queryStoryComments(String id) throws Exception {
		List<Comment> storyComments = new ArrayList<Comment>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from comment where commentType = 'story' and commentId = " + id + " order by id desc limit 0,5";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setId(rs.getLong("id"));
			comment.setCommentName(rs.getString("commentName"));
			comment.setContent(rs.getString("content"));
			comment.setCommentTime(rs.getTimestamp("commentTime"));
			comment.setCommentId(rs.getLong("commentId"));
			comment.setCommentType(rs.getString("commentType"));
			storyComments.add(comment);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return storyComments;
		
	}
	public List<Comment> queryActivityComments(String id) throws Exception {
		List<Comment> activityComments = new ArrayList<Comment>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from comment where commentType = 'experience' and commentId = " + id + " order by id desc limit 0,5";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setId(rs.getLong("id"));
			comment.setCommentName(rs.getString("commentName"));
			comment.setContent(rs.getString("content"));
			comment.setCommentTime(rs.getTimestamp("commentTime"));
			comment.setCommentId(rs.getLong("commentId"));
			comment.setCommentType(rs.getString("commentType"));
			activityComments.add(comment);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return activityComments;
	}
	public List<showComment2> showComments(String id,String type) throws Exception {
		List<showComment2> showComment2s = new ArrayList<showComment2>();
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "SELECT comment.id,replycomment.parentCommentId,content,commentName,replyContent,replyCommentUserName,comment.commentTime,comment.commentId,replycomment.commentTime replyCommentTime,headImageUrl FROM comment LEFT JOIN replyComment ON comment.id = replyComment.parentCommentId LEFT JOIN users ON comment.commentName = users.name where `comment`.commentId = ? and `comment`.commentType = ? ORDER BY `comment`.commentTime desc";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, type);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			showComment2 showComment2 = new showComment2();
			showComment2.setId(rs.getLong("id"));
			showComment2.setParentCommentId(rs.getLong("parentCommentId"));
			showComment2.setCommentId(rs.getLong("commentId"));
			showComment2.setContent(rs.getString("content"));
			showComment2.setCommentName(rs.getString("commentName"));
		    showComment2.setReplyContent(rs.getString("replyContent"));
		    showComment2.setReplyCommentUserName(rs.getString("replyCommentUserName"));
			showComment2.setCommentTime(rs.getTimestamp("commentTime"));
			showComment2.setReplyCommentTime(rs.getString("replyCommentTime"));
			showComment2.setHeadImageUrl(rs.getString("headImageUrl"));
			showComment2s.add(showComment2);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return showComment2s;
	}
	public replyComment findReplyComment(String id,String type) throws Exception {
		Connection conn = DBUtil.getConnection();
		//Statement stat = conn.createStatement();
		String sql =  "select * from replyComment where parentCommentId = ? and commentType = ?";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, type);
		ResultSet rs = preparedStatement.executeQuery();
		replyComment replyComment = new replyComment();
		while (rs.next()) {
		replyComment.setId(rs.getLong("id"));
		replyComment.setReplyCommentUserName(rs.getString("replyCommentUserName"));
		replyComment.setParentCommentId(rs.getLong("parentCommentId"));
		replyComment.setReplyContent(rs.getString("replyContent"));
		replyComment.setCommentTime(rs.getString("commentTime"));
		replyComment.setState(rs.getString("state"));
		replyComment.setCommentType(rs.getString("commentType"));	
	}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return replyComment;
	}
	public Integer countComments(String id,String type) throws Exception{
		Connection conn = DBUtil.getConnection();
		Integer countComments = null;
		String sql = "select count(*) from comment where commentId = ? and commentType = ? and state = 1";
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, type);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			countComments = rs.getInt(1);
		}
		rs.close();
		preparedStatement.close();
		DBUtil.close(conn);
		return countComments;
	}

}
