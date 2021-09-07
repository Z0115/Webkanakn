package com.java.servise;

import java.util.List;

import com.java.dao.redpacketBaseDao;
import com.java.interfaces.redpacketInterface;
import com.java.pojo.Redpacket;

public class redpacketServise implements redpacketInterface{

	redpacketBaseDao dao = new redpacketBaseDao();
	//查询未过期和过期和使用过红包
	public List<Redpacket> query1(String redpacket_state, int user_ID) {
		String sql = "select * from redpacket where redpacket_state =? and user_ID=?";
		List<Redpacket> list = dao.query(sql, redpacket_state, user_ID);
		return list;
	}

	//查询所有红包
	public List<Redpacket> queryAll(int user_ID) {
		String sql = "select * from redpacket where user_ID=?";
		List<Redpacket> list = dao.query(sql, user_ID);
		return list;
	}

	//修改红包状态
	public boolean update(int redpacket_id, String redpacket_state, int user_ID) {
		String sql = "update redpacket set redpacket_state=? where redpacket_id=? and redpacket_state !=? and user_ID=?";
		String state = "已使用";
		boolean b = dao.updateDeleteInsert(sql, redpacket_state, redpacket_id, state, user_ID);
		return b;
	}
	

}
