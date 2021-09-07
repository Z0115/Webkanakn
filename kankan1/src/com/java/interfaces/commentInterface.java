package com.java.interfaces;

import java.util.List;

import com.java.pojo.Comment;

public interface commentInterface {
	//根据商品id查询所有评论
	List<Comment> query1(int shop_ID);
	//根据客户id查询自己评论过的商品信息
	List<Comment> query2(int user_ID);
	
	//发表评论
	boolean insert(int shop_ID,int user_ID,String comment_text);
	
}
