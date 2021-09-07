package com.java.pojo;

public class Carousel {
	
	private Integer carousel_id   ;
	private String carousel_url  ;
	private String carousel_time ;
	public Carousel(Integer carousel_id, String carousel_url, String carousel_time) {
		super();
		this.carousel_id = carousel_id;
		this.carousel_url = carousel_url;
		this.carousel_time = carousel_time;
	}
	@Override
	public String toString() {
		return "Carousel [carousel_id=" + carousel_id + ", carousel_url=" + carousel_url + ", carousel_time="
				+ carousel_time + "]";
	}
	public Carousel() {
		super();
	}
	public Integer getCarousel_id() {
		return carousel_id;
	}
	public void setCarousel_id(Integer carousel_id) {
		this.carousel_id = carousel_id;
	}
	public String getCarousel_url() {
		return carousel_url;
	}
	public void setCarousel_url(String carousel_url) {
		this.carousel_url = carousel_url;
	}
	public String getCarousel_time() {
		return carousel_time;
	}
	public void setCarousel_time(String carousel_time) {
		this.carousel_time = carousel_time;
	}

	
	

}
