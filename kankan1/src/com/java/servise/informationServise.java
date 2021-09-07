package com.java.servise;

import java.util.List;

import com.java.dao.informationBaseDao;
import com.java.interfaces.information;
import com.java.pojo.Information;

public class informationServise implements information{
informationBaseDao dao =new informationBaseDao();

	public boolean insert(Information information) {
		String sql="insert into information values(null,?,?,?,?,?,?,?,?)";
		boolean b = dao.updateDeleteInsert(sql, information.getShop_ID(),information.getInformation_time(),information.getShop_num(),information.getStyle1_ID(),information.getStyle2_ID(),information.getInformation_state(),information.getSa_ID(),information.getUser_ID());
		return b;
	}

	@Override
	public List<Information> query(String information_state, int user_ID) {
		String sql="select * from information where information_state=? and user_ID=?";
		List<Information>list =dao.query(sql, information_state,user_ID);
		return list;
	}

	@Override
	public boolean update(String information_state, int information_id) {
		String sql="update information set information_state=? where information_id=?";
		boolean b=dao.updateDeleteInsert(sql, information_state,information_id);
		return b;
	}

	@Override
	public List<Information> query2(int user_ID) {
		String sql="select * from information where user_ID=?";
		List<Information>list =dao.query(sql,user_ID);
		return list;
	}

	@Override
	public List<Information> query3(int information_id) {
		String sql="select * from information where information_id=?";
		List<Information>list =dao.query(sql,information_id);
		return list;
	}

	@Override
	public boolean del(int information_id, String state, String state2) {
		String sql="delete from information where information_id=? and information_state=? or information_state=?";
		boolean b = dao.updateDeleteInsert(sql, information_id,state,state2);
		return b;
	}
	
	public List<Information> query() {
		String sql="select * from information";
		List<Information>list =dao.query(sql);
		return list;
	}

}
