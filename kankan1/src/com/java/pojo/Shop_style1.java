package com.java.pojo;

public class Shop_style1 {
	private Integer style1_id     ;
	private String style1_text   ;
	private Integer shop_ID       ;
	public Shop_style1(Integer style1_id, String style1_text, Integer shop_ID) {
		super();
		this.style1_id = style1_id;
		this.style1_text = style1_text;
		this.shop_ID = shop_ID;
	}
	public Integer getStyle1_id() {
		return style1_id;
	}
	public void setStyle1_id(Integer style1_id) {
		this.style1_id = style1_id;
	}
	public String getStyle1_text() {
		return style1_text;
	}
	public void setStyle1_text(String style1_text) {
		this.style1_text = style1_text;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	public Shop_style1() {
		super();
	}
	@Override
	public String toString() {
		return "Shop_style1 [style1_id=" + style1_id + ", style1_text=" + style1_text + ", shop_ID=" + shop_ID + "]";
	}
	

}
