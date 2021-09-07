package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.pojo.Announcement;
import com.java.pojo.Discounts;

public class discountsBaseDao {
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
	public List<Discounts> query(String sql,Object...objects) {
		List<Discounts> list=new ArrayList<Discounts>();
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
				Discounts c=new Discounts(rs.getInt(1),rs.getString(2));
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
