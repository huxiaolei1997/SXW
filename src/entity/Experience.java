package entity;

import java.sql.Timestamp;

public class Experience {
	private long id;
	private String experTitle;
	private String content;
	private String imageUrl;
	private Timestamp addtime;
	private String type;
	private String display;
	private String browsingTimes;
	private String likes;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getExperTitle() {
		return experTitle;
	}

	public void setExperTitle(String experTitle) {
		this.experTitle = experTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getBrowsingTimes() {
		return browsingTimes;
	}

	public void setBrowsingTimes(String browsingTimes) {
		this.browsingTimes = browsingTimes;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

}
