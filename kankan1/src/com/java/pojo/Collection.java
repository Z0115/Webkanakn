package com.java.pojo;

public class Collection {
	private Integer collection_id ;
	private Integer shop_ID       ;
	private Integer user_ID       ;
	public Integer getCollection_id() {
		return collection_id;
	}
	public void setCollection_id(Integer collection_id) {
		this.collection_id = collection_id;
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
	@Override
	public String toString() {
		return "Collection [collection_id=" + collection_id + ", shop_ID=" + shop_ID + ", user_ID=" + user_ID + "]";
	}
	public Collection(Integer collection_id, Integer shop_ID, Integer user_ID) {
		super();
		this.collection_id = collection_id;
		this.shop_ID = shop_ID;
		this.user_ID = user_ID;
	}
	public Collection() {
		super();
	}

}
