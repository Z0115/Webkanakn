package com.java.interfaces;

import java.util.List;
import com.java.pojo.Redpacket;

public interface redpacketInterface {
	//查询未过期和过期和使用过红包
		List<Redpacket> query1(String redpacket_state,int user_ID);

		//查询所有红包
		List<Redpacket> queryAll(int user_ID);
		
		//修改红包状态
	    boolean update(int redpacket_id,String redpacket_state,int user_ID);

}
