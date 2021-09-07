package com.java.pojo;

public class Advertising {
	private Integer advertising_id  ;
	private String adver_img       ;
	private String adver_text      ;
	private String adver_time      ;
	private Integer price           ;
	private Integer shop_ID;
	public Integer getAdvertising_id() {
		return advertising_id;
	}
	public void setAdvertising_id(Integer advertising_id) {
		this.advertising_id = advertising_id;
	}
	public String getAdver_img() {
		return adver_img;
	}
	public void setAdver_img(String adver_img) {
		this.adver_img = adver_img;
	}
	public String getAdver_text() {
		return adver_text;
	}
	public void setAdver_text(String adver_text) {
		this.adver_text = adver_text;
	}
	public String getAdver_time() {
		return adver_time;
	}
	public void setAdver_time(String adver_time) {
		this.adver_time = adver_time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	@Override
	public String toString() {
		return "Advertising [advertising_id=" + advertising_id + ", adver_img=" + adver_img + ", adver_text="
				+ adver_text + ", adver_time=" + adver_time + ", price=" + price + ", shop_ID=" + shop_ID + "]";
	}
	public Advertising(Integer advertising_id, String adver_img, String adver_text, String adver_time, Integer price,
			Integer shop_ID) {
		super();
		this.advertising_id = advertising_id;
		this.adver_img = adver_img;
		this.adver_text = adver_text;
		this.adver_time = adver_time;
		this.price = price;
		this.shop_ID = shop_ID;
	}
	public Advertising() {
		super();
	}
	

}
