package com.java.pojo;

public class Coupon {
	
	private Integer coupon_id         ;
	private Integer coupon_price      ;
	private String coupon_text       ;
	private String coupon_begin_time ;
	private String coupon_end_time   ;
	private String coupon_state      ;
	private Integer shop_ID           ;
	private Integer user_ID           ;
	public Integer getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}
	public Integer getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(Integer coupon_price) {
		this.coupon_price = coupon_price;
	}
	public String getCoupon_text() {
		return coupon_text;
	}
	public void setCoupon_text(String coupon_text) {
		this.coupon_text = coupon_text;
	}
	public String getCoupon_begin_time() {
		return coupon_begin_time;
	}
	public void setCoupon_begin_time(String coupon_begin_time) {
		this.coupon_begin_time = coupon_begin_time;
	}
	public String getCoupon_end_time() {
		return coupon_end_time;
	}
	public void setCoupon_end_time(String coupon_end_time) {
		this.coupon_end_time = coupon_end_time;
	}
	public String getCoupon_state() {
		return coupon_state;
	}
	public void setCoupon_state(String coupon_state) {
		this.coupon_state = coupon_state;
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
		return "Coupon [coupon_id=" + coupon_id + ", coupon_price=" + coupon_price + ", coupon_text=" + coupon_text
				+ ", coupon_begin_time=" + coupon_begin_time + ", coupon_end_time=" + coupon_end_time
				+ ", coupon_state=" + coupon_state + ", shop_ID=" + shop_ID + ", user_ID=" + user_ID + "]";
	}
	public Coupon(Integer coupon_id, Integer coupon_price, String coupon_text, String coupon_begin_time,
			String coupon_end_time, String coupon_state, Integer shop_ID, Integer user_ID) {
		super();
		this.coupon_id = coupon_id;
		this.coupon_price = coupon_price;
		this.coupon_text = coupon_text;
		this.coupon_begin_time = coupon_begin_time;
		this.coupon_end_time = coupon_end_time;
		this.coupon_state = coupon_state;
		this.shop_ID = shop_ID;
		this.user_ID = user_ID;
	}
	public Coupon() {
		super();
	}


}
