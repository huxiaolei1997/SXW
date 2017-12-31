package entity;

import java.sql.Timestamp;



public class IpAddress {
private long id;
private String ipAddress;
private String location;
private Timestamp accessTime;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}

public String getIpAddress() {
	return ipAddress;
}
public void setIpAddress(String ipAddress) {
	this.ipAddress = ipAddress;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public Timestamp getAccessTime() {
	return accessTime;
}
public void setAccessTime(Timestamp accessTime) {
	this.accessTime = accessTime;
}

}
