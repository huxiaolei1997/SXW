package entity;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 版本号
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private String name;
	private String headImageUrl;
	private String sex;
	private String pwd;
	private String conninfo;
	private String introduce;
	private String ifadmin;
	//无参数的构造器
	public User() {
		// TODO Auto-generated constructor stub
		super();
	}
	//有参数的构造器
	public User (long id,String name,String headImageUrl,String sex,String pwd,String conninfo,String introduce,String ifadmin){
		super();
		this.id = id;
		this.name = name;
		this.headImageUrl = headImageUrl;
		this.sex = sex;
		this.pwd = pwd;
		this.conninfo = conninfo;
		this.introduce = introduce;
		this.ifadmin = ifadmin;

	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getHeadImageUrl() {
		return headImageUrl;
	}
	public void setHeadImageUrl(String headImageUrl) {
		this.headImageUrl = headImageUrl;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getConninfo() {
		return conninfo;
	}
	public void setConninfo(String conninfo) {
		this.conninfo = conninfo;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getIfadmin() {
		return ifadmin;
	}
	public void setIfadmin(String ifadmin) {
		this.ifadmin = ifadmin;
	}
	public String toString(){
		return "User [id=" + id + ", name=" + name + ", headImageUrl=" + headImageUrl
				+ ", sex=" + sex + ", pwd=" + pwd + ",conninfo=" + conninfo + ",introduce=" + introduce + ",ifadmin=" + ifadmin + "]";
	}

}
