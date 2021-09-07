package com.java.pojo;

public class Shop {
	private Integer shop_id       ;
	private Integer adress_ID     ;
	private String shop_name     ;
	private Integer shop_price    ;
	private String shop_text     ;
	private String shop_img      ;
	private Integer num           ;
	private Integer purchase_num  ;
	private Integer type_ID       ;
	public Integer getShop_id() {
		return shop_id;
	}
	public void setShop_id(Integer shop_id) {
		this.shop_id = shop_id;
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
	public Shop(Integer shop_id, Integer adress_ID, String shop_name, Integer shop_price, String shop_text,
			String shop_img, Integer num, Integer purchase_num, Integer type_ID) {
		super();
		this.shop_id = shop_id;
		this.adress_ID = adress_ID;
		this.shop_name = shop_name;
		this.shop_price = shop_price;
		this.shop_text = shop_text;
		this.shop_img = shop_img;
		this.num = num;
		this.purchase_num = purchase_num;
		this.type_ID = type_ID;
	}
	public Shop() {
		super();
	}
	@Override
	public String toString() {
		return "Shop [shop_id=" + shop_id + ", adress_ID=" + adress_ID + ", shop_name=" + shop_name + ", shop_price="
				+ shop_price + ", shop_text=" + shop_text + ", shop_img=" + shop_img + ", num=" + num
				+ ", purchase_num=" + purchase_num + ", type_ID=" + type_ID + "]";
	}

	public boolean equals(Object obj) {
		if(this ==obj) {
			return true;
		}
		if(obj instanceof Shop) {
			Shop shop =(Shop)obj;
			if(this.getShop_id()==shop.getShop_id()) {
				return true;
			}
		}
		return false;
	}
	
	public int hashCode() {
		return this.getShop_id().hashCode();
	}
	

}
