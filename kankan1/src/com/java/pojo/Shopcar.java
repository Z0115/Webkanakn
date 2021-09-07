package com.java.pojo;

public class Shopcar {
	private Integer shopcar_id  ;
	private Integer shop_ID     ;
	private Integer style1_ID   ;
	private Integer style2_ID   ;
	private Integer user_ID     ;
	public Integer getShopcar_id() {
		return shopcar_id;
	}
	public void setShopcar_id(Integer shopcar_id) {
		this.shopcar_id = shopcar_id;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	public Integer getStyle1_ID() {
		return style1_ID;
	}
	public void setStyle1_ID(Integer style1_ID) {
		this.style1_ID = style1_ID;
	}
	public Integer getStyle2_ID() {
		return style2_ID;
	}
	public void setStyle2_ID(Integer style2_ID) {
		this.style2_ID = style2_ID;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	@Override
	public String toString() {
		return "Shopcar [shopcar_id=" + shopcar_id + ", shop_ID=" + shop_ID + ", style1_ID=" + style1_ID
				+ ", style2_ID=" + style2_ID + ", user_ID=" + user_ID + "]";
	}
	public Shopcar(Integer shopcar_id, Integer shop_ID, Integer style1_ID, Integer style2_ID, Integer user_ID) {
		super();
		this.shopcar_id = shopcar_id;
		this.shop_ID = shop_ID;
		this.style1_ID = style1_ID;
		this.style2_ID = style2_ID;
		this.user_ID = user_ID;
	}
	public Shopcar() {
		super();
	}

	
	

}
