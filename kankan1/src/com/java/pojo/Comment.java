package com.java.pojo;

public class Comment {            
	private Integer comment_id    ;
	private Integer shop_ID       ;
	private Integer user_ID       ;
	private String comment_text  ;
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public Comment(Integer comment_id, Integer shop_ID, Integer user_ID, String comment_text) {
		super();
		this.comment_id = comment_id;
		this.shop_ID = shop_ID;
		this.user_ID = user_ID;
		this.comment_text = comment_text;
	}
	public Comment() {
		super();
	}
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", shop_ID=" + shop_ID + ", user_ID=" + user_ID + ", comment_text="
				+ comment_text + "]";
	}
	
}
