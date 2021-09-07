package com.java.servise;

import java.util.List;

import com.java.dao.announcementBaseDao;
import com.java.interfaces.announcementInterface;
import com.java.pojo.Announcement;
import com.java.pojo.Discounts;

public class announcementServise implements announcementInterface{
announcementBaseDao dao =new announcementBaseDao();
	@Override
	public List<Announcement> query() {
		String sql="select * from announcement";
		List<Announcement> list =dao.query(sql);
		return list;
	}
	

}
