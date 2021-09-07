package com.java.pojo;

public class Shippingaddress {
	private Integer sa_id      ;
	private String sa_name    ;
	private String sa_tel     ;
	private Integer province_id;
	private Integer city_id    ;
	private Integer area_id    ;
	private String sa_text    ;
	private Integer user_ID    ;
	public Integer getSa_id() {
		return sa_id;
	}
	public void setSa_id(Integer sa_id) {
		this.sa_id = sa_id;
	}
	public String getSa_name() {
		return sa_name;
	}
	public void setSa_name(String sa_name) {
		this.sa_name = sa_name;
	}
	public String getSa_tel() {
		return sa_tel;
	}
	public void setSa_tel(String sa_tel) {
		this.sa_tel = sa_tel;
	}
	public Integer getProvince_id() {
		return province_id;
	}
	public void setProvince_id(Integer province_id) {
		this.province_id = province_id;
	}
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public Integer getArea_id() {
		return area_id;
	}
	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}
	public String getSa_text() {
		return sa_text;
	}
	public void setSa_text(String sa_text) {
		this.sa_text = sa_text;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	@Override
	public String toString() {
		return "Shippingaddress [sa_id=" + sa_id + ", sa_name=" + sa_name + ", sa_tel=" + sa_tel + ", province_id="
				+ province_id + ", city_id=" + city_id + ", area_id=" + area_id + ", sa_text=" + sa_text + ", user_ID="
				+ user_ID + "]";
	}
	public Shippingaddress(Integer sa_id, String sa_name, String sa_tel, Integer province_id, Integer city_id,
			Integer area_id, String sa_text, Integer user_ID) {
		super();
		this.sa_id = sa_id;
		this.sa_name = sa_name;
		this.sa_tel = sa_tel;
		this.province_id = province_id;
		this.city_id = city_id;
		this.area_id = area_id;
		this.sa_text = sa_text;
		this.user_ID = user_ID;
	}
	public Shippingaddress() {
		super();
	}


}
