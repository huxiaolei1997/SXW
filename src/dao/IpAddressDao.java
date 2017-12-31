package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import entity.IpAddress;
import util.DBUtil;

public class IpAddressDao {
public void queryIpAddresses(String ipAddress,String location,Timestamp accessTime) throws Exception{
	Connection conn = DBUtil.getConnection();
	//List<IpAddress> ipAddresses = new ArrayList<IpAddress>();
	String sql = "insert into ipaddress(ipAddress,location,accessTime) values(?,?,?)";
	PreparedStatement preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, ipAddress);
    preparedStatement.setString(2, location);
    preparedStatement.setTimestamp(3, accessTime);
    preparedStatement.executeUpdate();
    preparedStatement.close();
    conn.close();
}
public List<IpAddress> showIpAddress(Integer pageNum,String sqlBuilder) throws Exception{
	Connection conn = DBUtil.getConnection();
	List<IpAddress> ipAddresses = new ArrayList<IpAddress>();
	String sql = sqlBuilder + " order by accessTime desc limit " + (pageNum - 1) * 10 + "," + 10;
	PreparedStatement preparedStatement = conn.prepareStatement(sql);
	ResultSet rs = preparedStatement.executeQuery();
	while(rs.next()){
		IpAddress ipAddress = new IpAddress();
		ipAddress.setId(rs.getLong("id"));
		ipAddress.setIpAddress(rs.getString("ipAddress"));
		ipAddress.setLocation(rs.getString("location"));
		ipAddress.setAccessTime(rs.getTimestamp("accessTime"));
		ipAddresses.add(ipAddress);
	}
	rs.close();
	preparedStatement.close();
	conn.close();
	return ipAddresses;
}
List<String> ipAddresses = new ArrayList<String>();
public List<String> countIpAddress(String day) throws Exception{
	Connection conn = DBUtil.getConnection();
	String sql = "select count(*) from ipaddress where accessTime like '%" + day + "%'";
	PreparedStatement preparedStatement = conn.prepareStatement(sql);
	ResultSet rs = preparedStatement.executeQuery();
	while(rs.next()){
		ipAddresses.add("'" + String.valueOf(rs.getInt(1)) + "'");
	}
	rs.close();
	preparedStatement.close();
	conn.close();
	return ipAddresses;
}
}
