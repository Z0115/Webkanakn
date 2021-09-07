package com.java.pojo;

public class Shop_type {
	private Integer type_id;
	private String type;
	@Override
	public String toString() {
		return "Shop_type [type_id=" + type_id + ", type=" + type + "]";
	}
	public Shop_type(Integer type_id, String type) {
		super();
		this.type_id = type_id;
		this.type = type;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Shop_type() {
		super();
	}
	

}
