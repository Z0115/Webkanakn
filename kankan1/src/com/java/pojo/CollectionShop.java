package com.java.pojo;

public class CollectionShop {
	private Integer collection_id ;
	private Integer shop_ID       ;
	private Integer user_ID       ;
	private Integer s_id       ;
	private Integer adress_ID     ;
	private String shop_name     ;
	private Integer shop_price    ;
	private String shop_text     ;
	private String shop_img      ;
	private Integer num           ;
	private Integer purchase_num  ;
	private Integer type_ID       ;
	public CollectionShop() {
		super();
	}
	public CollectionShop(Integer collection_id, Integer shop_ID, Integer user_ID, Integer s_id, Integer adress_ID,
			String shop_name, Integer shop_price, String shop_text, String shop_img, Integer num, Integer purchase_num,
			Integer type_ID) {
		super();
		this.collection_id = collection_id;
		this.shop_ID = shop_ID;
		this.user_ID = user_ID;
		this.s_id = s_id;
		this.adress_ID = adress_ID;
		this.shop_name = shop_name;
		this.shop_price = shop_price;
		this.shop_text = shop_text;
		this.shop_img = shop_img;
		this.num = num;
		this.purchase_num = purchase_num;
		this.type_ID = type_ID;
	}
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
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public Integer getAdress_ID() {
		return adress_ID;
	}
	public void setAdress_ID(Integer adress_ID) {
		this.adress_ID = adress_ID;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public Integer getShop_price() {
		return shop_price;
	}
	public void setShop_price(Integer shop_price) {
		this.shop_price = shop_price;
	}
	public String getShop_text() {
		return shop_text;
	}
	public void setShop_text(String shop_text) {
		this.shop_text = shop_text;
	}
	public String getShop_img() {
		return shop_img;
	}
	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getPurchase_num() {
		return purchase_num;
	}
	public void setPurchase_num(Integer purchase_num) {
		this.purchase_num = purchase_num;
	}
	public Integer getType_ID() {
		return type_ID;
	}
	public void setType_ID(Integer type_ID) {
		this.type_ID = type_ID;
	}
	@Override
	public String toString() {
		return "collectionShop [collection_id=" + collection_id + ", shop_ID=" + shop_ID + ", user_ID=" + user_ID
				+ ", s_id=" + s_id + ", adress_ID=" + adress_ID + ", shop_name=" + shop_name + ", shop_price="
				+ shop_price + ", shop_text=" + shop_text + ", shop_img=" + shop_img + ", num=" + num
				+ ", purchase_num=" + purchase_num + ", type_ID=" + type_ID + "]";
	}
	
}
