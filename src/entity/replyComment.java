package entity;



public class replyComment {
private long id;
private String replyCommentUserName;
private long parentCommentId;
private String replyContent;
private String commentTime;
private String commentType;
private String state;


public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}

public String getReplyCommentUserName() {
	return replyCommentUserName;
}
public void setReplyCommentUserName(String replyCommentUserName) {
	this.replyCommentUserName = replyCommentUserName;
}
public long getParentCommentId() {
	return parentCommentId;
}
public void setParentCommentId(long parentCommentId) {
	this.parentCommentId = parentCommentId;
}

public String getReplyContent() {
	return replyContent;
}
public void setReplyContent(String replyContent) {
	this.replyContent = replyContent;
}
public String getCommentTime() {
	return commentTime;
}
public void setCommentTime(String commentTime) {
	this.commentTime = commentTime;
}

public String getCommentType() {
	return commentType;
}
public void setCommentType(String commentType) {
	this.commentType = commentType;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}

}
