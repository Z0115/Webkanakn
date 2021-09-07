package com.java.pojo;

public class Customer {

	private Integer customer_id        ;
	private String customer_name      ;
	private String customer_nickname  ;
	private String customer_sex       ;
	private String customer_borthday  ;
	private String customer_tel       ;
	private String customer_img       ;
	private Integer customer_balance   ;
	private String customer_emil;
	private String customer_sfz;
	private Integer user_ID            ;
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_nickname() {
		return customer_nickname;
	}
	public void setCustomer_nickname(String customer_nickname) {
		this.customer_nickname = customer_nickname;
	}
	public String getCustomer_sex() {
		return customer_sex;
	}
	public void setCustomer_sex(String customer_sex) {
		this.customer_sex = customer_sex;
	}
	public String getCustomer_borthday() {
		return customer_borthday;
	}
	public void setCustomer_borthday(String customer_borthday) {
		this.customer_borthday = customer_borthday;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_img() {
		return customer_img;
	}
	public void setCustomer_img(String customer_img) {
		this.customer_img = customer_img;
	}
	public Integer getCustomer_balance() {
		return customer_balance;
	}
	public void setCustomer_balance(Integer customer_balance) {
		this.customer_balance = customer_balance;
	}
	public String getCustomer_emil() {
		return customer_emil;
	}
	public void setCustomer_emil(String customer_emil) {
		this.customer_emil = customer_emil;
	}
	public String getCustomer_sfz() {
		return customer_sfz;
	}
	public void setCustomer_sfz(String customer_sfz) {
		this.customer_sfz = customer_sfz;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	public Customer(Integer customer_id, String customer_name, String customer_nickname, String customer_sex,
			String customer_borthday, String customer_tel, String customer_img, Integer customer_balance,
			String customer_emil, String customer_sfz, Integer user_ID) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_nickname = customer_nickname;
		this.customer_sex = customer_sex;
		this.customer_borthday = customer_borthday;
		this.customer_tel = customer_tel;
		this.customer_img = customer_img;
		this.customer_balance = customer_balance;
		this.customer_emil = customer_emil;
		this.customer_sfz = customer_sfz;
		this.user_ID = user_ID;
	}
	public Customer() {
		super();
	}
	@Override
	public String toString() {
		return "Customer [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_nickname="
				+ customer_nickname + ", customer_sex=" + customer_sex + ", customer_borthday=" + customer_borthday
				+ ", customer_tel=" + customer_tel + ", customer_img=" + customer_img + ", customer_balance="
				+ customer_balance + ", customer_emil=" + customer_emil + ", customer_sfz=" + customer_sfz
				+ ", user_ID=" + user_ID + "]";
	}
	

	
	
}
