package com.java.servise;

import java.util.List;

import com.java.dao.commentBaseDao;
import com.java.interfaces.commentInterface;
import com.java.pojo.Comment;

public class commentServise implements commentInterface{
commentBaseDao dao =new commentBaseDao();
	//根据商品id查询所有评论
	public List<Comment> query1(int shop_ID) {
		String sql ="select * from comment where shop_ID=?";
		List<Comment>list=dao.query(sql, shop_ID);
		return list;
	}

	//根据客户id查询自己评论过的商品信息
	public List<Comment> query2(int user_ID) {
		String sql ="select * from comment where user_ID=?";
		List<Comment>list=dao.query(sql, user_ID);
		return list;
	}
//发表评论
	public boolean insert(int shop_ID, int user_ID, String comment_text) {
		String sql="insert into comment values(null,?,?,?)";
		boolean b = dao.updateDeleteInsert(sql, shop_ID,user_ID,comment_text);
		return b;
	}

}
