package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.pojo.Announcement;
import com.java.pojo.Shop_type;

public class shop_typeBaseDao {
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
	public List<Shop_type> query(String sql,Object...objects) {
		List<Shop_type> list=new ArrayList<Shop_type>();
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
				Shop_type c=new Shop_type(rs.getInt(1),rs.getString(2));
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
