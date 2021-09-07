package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.pojo.Announcement;
import com.java.pojo.Coupon;

public class couponBaseDao {

	static Connection conn=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	
	public boolean updateDeleteInsert(String sql,Object...objects) {
		
		try {
			conn =DBConnection.getConnection();
			ps=conn.prepareStatement(sql);
			
			if(objects !=null) {
				for (int i = 0; i < objects.length; i++) {
					ps.setObject(i+1, objects[i]);
				}
			}
			return ps.executeUpdate()>0;

			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.colse(conn, ps, rs);
		}
		return false;
	}
	public List<Coupon> query(String sql,Object...objects) {
		List<Coupon> list=new ArrayList<Coupon>();
		try {
			conn =DBConnection.getConnection();
			ps=conn.prepareStatement(sql);
			
			if(objects !=null) {
				for (int i = 0; i < objects.length; i++) {
					ps.setObject(i+1, objects[i]);
				}
			}
			rs =ps.executeQuery();
			while(rs.next()) {
				Coupon c =new Coupon(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8));
				list.add(c);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.colse(conn, ps, rs);
		}
		return list;
	}
	
}
