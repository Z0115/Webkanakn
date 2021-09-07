package com.java.interfaces;

import java.util.List;

import com.java.pojo.Area;

public interface areaInterface {
	
	List<Area> queryID(int parent_id);

	List<Area> queryArea(int area_id);
	
	List<Area> queryname(String name);
}
