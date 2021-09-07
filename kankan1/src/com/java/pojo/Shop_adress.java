package com.java.pojo;

public class Shop_adress {
	private Integer adress_id;
	private String adress_name;
	@Override
	public String toString() {
		return "Shop_adress [adress_id=" + adress_id + ", adress_name=" + adress_name + "]";
	}
	public Shop_adress(Integer adress_id, String adress_name) {
		super();
		this.adress_id = adress_id;
		this.adress_name = adress_name;
	}
	public Shop_adress() {
		super();
	}
	public Integer getAdress_id() {
		return adress_id;
	}
	public void setAdress_id(Integer adress_id) {
		this.adress_id = adress_id;
	}
	public String getAdress_name() {
		return adress_name;
	}
	public void setAdress_name(String adress_name) {
		this.adress_name = adress_name;
	}
	


}
