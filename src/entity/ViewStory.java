package entity;

import java.sql.Timestamp;

public class ViewStory {
private long id;
private String user;
private String viewTitle;
private String introduction;
private String content;
private long browsingTimes;
private long likes;
private String imageUrl;
private Timestamp addtime;
private String type;
private String display;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}

public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getViewTitle() {
	return viewTitle;
}
public void setViewTitle(String viewTitle) {
	this.viewTitle = viewTitle;
}
public String getIntroduction() {
	return introduction;
}
public void setIntroduction(String introduction) {
	this.introduction = introduction;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public long getBrowsingTimes() {
	return browsingTimes;
}
public void setBrowsingTimes(long browsingTimes) {
	this.browsingTimes = browsingTimes;
}
public long getLikes() {
	return likes;
}
public void setLikes(long likes) {
	this.likes = likes;
}
public String getImageUrl() {
	return imageUrl;
}
public void setImageUrl(String imageUrl) {
	this.imageUrl = imageUrl;
}
public Timestamp getAddtime() {
	return addtime;
}
public void setAddtime(Timestamp addtime) {
	this.addtime = addtime;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getDisplay() {
	return display;
}
public void setDisplay(String display) {
	this.display = display;
}

}
