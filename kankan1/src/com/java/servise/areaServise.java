package com.java.servise;

import java.util.List;

import com.java.dao.areaBaseDao;
import com.java.interfaces.areaInterface;
import com.java.pojo.Area;

public class areaServise implements areaInterface{
areaBaseDao dao = new areaBaseDao();
//查询地址ַ
	public List<Area> queryID(int parent_id) {
		String sql="select * from area where parent_id=?";
		List<Area>list=dao.query(sql, parent_id);
		return list;
	}
	//查询地址ַ
	public List<Area> queryArea(int area_id) {
		String sql="select * from area where area_id=?";
		List<Area>list=dao.query(sql, area_id);
		return list;
	}
	@Override
	public List<Area> queryname(String name) {
		String sql="select * from area where cname=?";
		List<Area>list=dao.query(sql, name);
		return list;
	}

}
