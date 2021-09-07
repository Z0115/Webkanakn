package com.java.servise;

import java.util.List;

import com.java.dao.UserBaseDao;
import com.java.interfaces.userInterface;
import com.java.pojo.User;

public class UserServise implements userInterface {

	UserBaseDao dao = new UserBaseDao();
	@Override
	public List<User> query() {
		// TODO Auto-generated method stub
		return null;
	}

	//用户登录时使用
	public List<User> queryLogin(String username) {
		String sql="select * from user where username=?";
		List<User>list =dao.query(sql, username);
		return list;
	}

	//用户注册时使用
	public boolean insert(String username, String userpwd) {
		String sql="insert into user values(null,?,?,?)";
	    boolean b = dao.updateDeleteInsert(sql, username,userpwd,0);
	    return b;
	}

	@Override
	public List<User> queryID(String username) {
		String sql="select * from user where username=?";
		List<User>list=dao.query(sql, username);
		return list;
	}

	//根据id获取信息
	public List<User> queryUser(int user_ID) {
		String sql="select * from user where id=?";
		List<User>list=dao.query(sql, user_ID);
		return list;
	}
	@Override
	public boolean update(User user) {
		String sql="update user set userpwd=? where id=?";
		boolean b=dao.updateDeleteInsert(sql, user.getUserpwd(),user.getId());
		return b;
	}

}
