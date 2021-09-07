package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.pojo.Shop;
import com.java.pojo.Shopcar;

public class shopcarBaseDao {
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
	public List<Shopcar> query(String sql,Object...objects) {
		List<Shopcar> list=new ArrayList<Shopcar>();
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
				Shopcar c=new Shopcar(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
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
