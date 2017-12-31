package entity;

import java.sql.Timestamp;
import java.util.List;

public class showComment2 {
	private long id;
	private long parentCommentId;
	private long commentId;
	private String content;
	private String commentName;
	private String replyContent;
	private String replyCommentUserName;
	private Timestamp commentTime;
	private String replyCommentTime;
	private String headImageUrl;
	
	private List<showComment2> replyComment;
	private User user;
	private User replyUser;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public long getCommentId() {
		return commentId;
	}
	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}
	public long getParentCommentId() {
		return parentCommentId;
	}
	public void setParentCommentId(long parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommentName() {
		return commentName;
	}
	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyCommentUserName() {
		return replyCommentUserName;
	}
	public void setReplyCommentUserName(String replyCommentUserName) {
		this.replyCommentUserName = replyCommentUserName;
	}
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	public String getReplyCommentTime() {
		return replyCommentTime;
	}
	public void setReplyCommentTime(String replyCommentTime) {
		this.replyCommentTime = replyCommentTime;
	}
	public String getHeadImageUrl() {
		return headImageUrl;
	}
	public void setHeadImageUrl(String headImageUrl) {
		this.headImageUrl = headImageUrl;
	}
	public List<showComment2> getReplyComment() {
		return replyComment;
	}
	public void setReplyComment(List<showComment2> replyComment) {
		this.replyComment = replyComment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getReplyUser() {
		return replyUser;
	}
	public void setReplyUser(User replyUser) {
		this.replyUser = replyUser;
	}
	
	
}
