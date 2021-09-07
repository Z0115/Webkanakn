package com.java.servise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.java.dao.DBConnection;
import com.java.interfaces.zhy;
import com.java.pojo.Information;
import com.java.pojo.User;

public class zhy1 implements zhy{
    static Connection conn=null;
    static PreparedStatement pst=null;
    static ResultSet rst=null;

	public int getAllList() {
	  List<User>list=new ArrayList<User>();
	  String sql="select * from user";
	  conn=DBConnection.getConnection();
	  try {
		pst=conn.prepareStatement(sql);
		rst=pst.executeQuery();
		while (rst.next()) {
			int id =rst.getInt("id");
			String username=rst.getString("username");
			String userpwd=rst.getString("userpwd");
			int grading =rst.getInt("grading");
			User user=new User(id, username, userpwd, grading);
		   
			list.add(user);
			
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		return list.size();
	}

	@Override
	public int getALLdd1() {
		  List<Information>d1=new ArrayList<Information>();
		  String sql="select * from information";
		  conn=DBConnection.getConnection();
		  try {
				pst=conn.prepareStatement(sql);
				rst=pst.executeQuery();
				while (rst.next()) {
					int information_id =rst.getInt("information_id");
					int shop_ID=rst.getInt("shop_ID");
					String information_time=rst.getString("information_time");
					int shop_num =rst.getInt("shop_num");
					int style1_ID =rst.getInt("style1_ID");
					int style2_ID =rst.getInt("style2_ID");
					String information_state=rst.getString("information_state");
					int sa_ID =rst.getInt("sa_ID");
					int user_ID =rst.getInt("user_ID");
					Information information =new Information(information_id, shop_ID, information_time, shop_num, style1_ID, style2_ID, information_state, sa_ID, user_ID);

					
				   
					d1.add(information);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
				return d1.size();
			}

	@Override
	public int getAllshop() {
		
		return 0;
	}
	}

	
	
  

