package com.java.pojo;

public class Information {
	private Integer information_id      ;
	private Integer shop_ID             ;
	private String information_time    ;
	private Integer shop_num            ;
	private Integer style1_ID           ;
	private Integer style2_ID           ;
	private String information_state   ;
	private Integer sa_ID               ;
	private Integer user_ID             ;
	public Integer getInformation_id() {
		return information_id;
	}
	public void setInformation_id(Integer information_id) {
		this.information_id = information_id;
	}
	public Integer getShop_ID() {
		return shop_ID;
	}
	public void setShop_ID(Integer shop_ID) {
		this.shop_ID = shop_ID;
	}
	public String getInformation_time() {
		return information_time;
	}
	public void setInformation_time(String information_time) {
		this.information_time = information_time;
	}
	public Integer getShop_num() {
		return shop_num;
	}
	public void setShop_num(Integer shop_num) {
		this.shop_num = shop_num;
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
	public String getInformation_state() {
		return information_state;
	}
	public void setInformation_state(String information_state) {
		this.information_state = information_state;
	}
	public Integer getSa_ID() {
		return sa_ID;
	}
	public void setSa_ID(Integer sa_ID) {
		this.sa_ID = sa_ID;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	@Override
	public String toString() {
		return "Information [information_id=" + information_id + ", shop_ID=" + shop_ID + ", information_time="
				+ information_time + ", shop_num=" + shop_num + ", style1_ID=" + style1_ID + ", style2_ID=" + style2_ID
				+ ", information_state=" + information_state + ", sa_ID=" + sa_ID + ", user_ID=" + user_ID + "]";
	}
	public Information(Integer information_id, Integer shop_ID, String information_time, Integer shop_num,
			Integer style1_ID, Integer style2_ID, String information_state, Integer sa_ID, Integer user_ID) {
		super();
		this.information_id = information_id;
		this.shop_ID = shop_ID;
		this.information_time = information_time;
		this.shop_num = shop_num;
		this.style1_ID = style1_ID;
		this.style2_ID = style2_ID;
		this.information_state = information_state;
		this.sa_ID = sa_ID;
		this.user_ID = user_ID;
	}
	public Information() {
		super();
	}
    
	
	
	

}
