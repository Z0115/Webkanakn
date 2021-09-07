package com.java.pojo;

public class Redpacket {
	private Integer redpacket_id          ;
	private String redpacket_name        ;
	private Integer redpacket_price       ;
	private String redpacket_begin_time  ;
	private String redpacket_end_time    ;
	private String redpacket_state       ;
	private Integer user_ID               ;
	public Integer getRedpacket_id() {
		return redpacket_id;
	}
	public void setRedpacket_id(Integer redpacket_id) {
		this.redpacket_id = redpacket_id;
	}
	public String getRedpacket_name() {
		return redpacket_name;
	}
	public void setRedpacket_name(String redpacket_name) {
		this.redpacket_name = redpacket_name;
	}
	public Integer getRedpacket_price() {
		return redpacket_price;
	}
	public void setRedpacket_price(Integer redpacket_price) {
		this.redpacket_price = redpacket_price;
	}
	public String getRedpacket_begin_time() {
		return redpacket_begin_time;
	}
	public void setRedpacket_begin_time(String redpacket_begin_time) {
		this.redpacket_begin_time = redpacket_begin_time;
	}
	public String getRedpacket_end_time() {
		return redpacket_end_time;
	}
	public void setRedpacket_end_time(String redpacket_end_time) {
		this.redpacket_end_time = redpacket_end_time;
	}
	public String getRedpacket_state() {
		return redpacket_state;
	}
	public void setRedpacket_state(String redpacket_state) {
		this.redpacket_state = redpacket_state;
	}
	public Integer getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(Integer user_ID) {
		this.user_ID = user_ID;
	}
	@Override
	public String toString() {
		return "Redpacket [redpacket_id=" + redpacket_id + ", redpacket_name=" + redpacket_name + ", redpacket_price="
				+ redpacket_price + ", redpacket_begin_time=" + redpacket_begin_time + ", redpacket_end_time="
				+ redpacket_end_time + ", redpacket_state=" + redpacket_state + ", user_ID=" + user_ID + "]";
	}
	public Redpacket(Integer redpacket_id, String redpacket_name, Integer redpacket_price, String redpacket_begin_time,
			String redpacket_end_time, String redpacket_state, Integer user_ID) {
		super();
		this.redpacket_id = redpacket_id;
		this.redpacket_name = redpacket_name;
		this.redpacket_price = redpacket_price;
		this.redpacket_begin_time = redpacket_begin_time;
		this.redpacket_end_time = redpacket_end_time;
		this.redpacket_state = redpacket_state;
		this.user_ID = user_ID;
	}
	public Redpacket() {
		super();
	}


}
