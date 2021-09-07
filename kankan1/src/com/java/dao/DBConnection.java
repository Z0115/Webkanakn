package com.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	
	private static final String DRIVERNAME="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1:3306/kankan?characterEncoding=utf-8";
	private static final String USER="root";
	private static final String PWD="123456";
	
	static {
		try {
			Class.forName(DRIVERNAME);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(URL,USER,PWD);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void colse(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if(conn !=null) {
				conn.close();
			}
			if(ps !=null) {
				ps.close();
			}
			if(rs !=null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

	

}
