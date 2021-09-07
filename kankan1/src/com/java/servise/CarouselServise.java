package com.java.servise;

import java.util.List;

import com.java.dao.carouselBaseDao;
import com.java.interfaces.carouselInterface;
import com.java.pojo.Carousel;

public class CarouselServise implements carouselInterface{

	carouselBaseDao dao = new carouselBaseDao();
	@Override
	public List<Carousel> query() {
		String sql="select * from carousel";
		List<Carousel> list =dao.query(sql);
		return list;
	}
	
	
	
	

}
