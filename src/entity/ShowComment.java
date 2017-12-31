package entity;

import java.sql.Timestamp;

public class ShowComment {
	private long userId;
	private String commentName;
	private Timestamp commentTime;
	private String headImageUrl;
	private String contentId;
	private String content;

	private User user;
	private replyComment replyComment;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getCommentName() {
		return commentName;
	}

	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}

	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public String getHeadImageUrl() {
		return headImageUrl;
	}

	public void setHeadImageUrl(String headImageUrl) {
		this.headImageUrl = headImageUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public replyComment getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(replyComment replyComment) {
		this.replyComment = replyComment;
	}

}
