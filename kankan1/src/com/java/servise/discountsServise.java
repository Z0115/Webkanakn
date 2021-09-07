package com.java.servise;

import java.util.List;

import com.java.dao.discountsBaseDao;
import com.java.interfaces.discountsInterface;
import com.java.pojo.Discounts;

public class discountsServise implements discountsInterface {
discountsBaseDao dao = new discountsBaseDao();
	@Override
	public List<Discounts> query() {
		String sql="select * from discounts";
		List<Discounts> list =dao.query(sql);
		return list;
	}

}
