package com.java.interfaces;

import java.util.List;

import com.java.pojo.Customer;

public interface customerinterface {
	
	//查询全部
	List<Customer> query();
	
	//单个查询
	List<Customer> query2(int id);

	//添加用户信息
	boolean insert(Customer customer);
	
	//修改用户信息
	boolean update(Customer customer);
	
	//修改头像
	boolean updateImg(String img,int user_ID);
	boolean updates(Customer customer);
}
