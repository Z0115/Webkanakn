package com.java.pojo;

public class Shop_style2 {
	private Integer style2_id    ;
	private Integer shop_ID      ;
	private String style2_text  ;
	public Integer getStyle2_id() {
		return style2_id;
	}
	public void setStyle2_id(Integer style2_id) {
		this.style2_id = style2_id;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	public String getStyle2_text() {
		return style2_text;
	}
	public void setStyle2_text(String style2_text) {
		this.style2_text = style2_text;
	}
	@Override
	public String toString() {
		return "Shop_style2 [style2_id=" + style2_id + ", shop_ID=" + shop_ID + ", style2_text=" + style2_text + "]";
	}
	public Shop_style2(Integer style2_id, Integer shop_ID, String style2_text) {
		super();
		this.style2_id = style2_id;
		this.shop_ID = shop_ID;
		this.style2_text = style2_text;
	}
	public Shop_style2() {
		super();
	}


}
