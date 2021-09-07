package com.java.pojo;

public class Area {
	private Integer area_id;
	private Integer parent_id;
	private String cname;
	public Integer getArea_id() {
		return area_id;
	}
	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Area [area_id=" + area_id + ", parent_id=" + parent_id + ", cname=" + cname + "]";
	}
	public Area(Integer area_id, Integer parent_id, String cname) {
		super();
		this.area_id = area_id;
		this.parent_id = parent_id;
		this.cname = cname;
	}
	public Area() {
		super();
	}
	
	

}
