package com.java.servise;

import java.util.List;

import com.java.dao.advertisingBaseDao;
import com.java.interfaces.advertisingInterface;
import com.java.pojo.Advertising;
import com.java.pojo.Announcement;

public class advertisingServise implements advertisingInterface{
	advertisingBaseDao dao = new advertisingBaseDao();
	@Override
	public List<Advertising> query() {
		String sql="select * from advertising";
		List<Advertising> list =dao.query(sql);
		return list;
	}

}
