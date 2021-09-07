package com.java.interfaces;

import java.util.List;

import com.java.pojo.User;

public interface userInterface {
	//查询所有
	List<User> query();
	//查询登录账号是否存在
	List<User> queryLogin(String username);

	boolean insert(String username,String userpwd);
	
	//获取新用户id
	List<User> queryID(String username);
	
	//根据id获取客户等级
	List<User> queryUser(int user_ID);
	boolean update(User user);
}
