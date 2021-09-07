package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.pojo.Collection;
import com.java.pojo.CollectionShop;;

public class collectionShopBaseDao {
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
	public List<CollectionShop> query(String sql,Object...objects) {
		List<CollectionShop> list=new ArrayList<CollectionShop>();
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
				CollectionShop c =new CollectionShop(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getInt(11),rs.getInt(12));
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
