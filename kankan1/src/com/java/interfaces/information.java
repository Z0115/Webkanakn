package com.java.interfaces;

import java.util.List;

import com.java.pojo.Information;

public interface information {
	//添加订单信息
	boolean insert(Information information);

	List<Information> query();
	//查询相关订单
	List<Information> query(String information_state, int user_ID);
	
	//查询所有订单
		List<Information> query2(int user_ID);
	
	//修改订单状态
	boolean update(String information_state,int information_id);
	
	//根据订单id查询订单
	List<Information> query3(int information_id);
	
	//客户删除订单信息
	boolean del(int information_id,String state,String state2);
	
}
