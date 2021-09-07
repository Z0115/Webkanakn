package com.java.pojo;

public class Announcement {
	private Integer announcement_id;
	private String announcement_text;
	public Integer getAnnouncement_id() {
		return announcement_id;
	}
	public void setAnnouncement_id(Integer announcement_id) {
		this.announcement_id = announcement_id;
	}
	public String getAnnouncement_text() {
		return announcement_text;
	}
	public void setAnnouncement_text(String announcement_text) {
		this.announcement_text = announcement_text;
	}
	public Announcement(Integer announcement_id, String announcement_text) {
		super();
		this.announcement_id = announcement_id;
		this.announcement_text = announcement_text;
	}
	@Override
	public String toString() {
		return "Announcement [announcement_id=" + announcement_id + ", announcement_text=" + announcement_text + "]";
	}
	public Announcement() {
		super();
	}
	


}
