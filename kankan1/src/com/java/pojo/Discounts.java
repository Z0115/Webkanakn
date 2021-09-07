package com.java.pojo;

public class Discounts {
	
	private Integer discounts_id;
	private String discounts_text;
	public Integer getDiscounts_id() {
		return discounts_id;
	}
	public void setDiscounts_id(Integer discounts_id) {
		this.discounts_id = discounts_id;
	}
	public String getDiscounts_text() {
		return discounts_text;
	}
	public void setDiscounts_text(String discounts_text) {
		this.discounts_text = discounts_text;
	}
	public Discounts(Integer discounts_id, String discounts_text) {
		super();
		this.discounts_id = discounts_id;
		this.discounts_text = discounts_text;
	}
	public Discounts() {
		super();
	}
	@Override
	public String toString() {
		return "Discounts [discounts_id=" + discounts_id + ", discounts_text=" + discounts_text + "]";
	}
	


}
