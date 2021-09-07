package com.java.servise;

import java.util.List;

import com.java.dao.shop_style1BaseDao;
import com.java.interfaces.shop_style1Interface;
import com.java.pojo.Shop_style1;

public class shop_style1Servise implements shop_style1Interface{
shop_style1BaseDao dao= new shop_style1BaseDao();
	//根据商品id查询样式
	public List<Shop_style1> query1(int shop_ID) {
		String sql="select * from shop_style1 where shop_ID=?";
		List<Shop_style1>list=dao.query(sql, shop_ID);
		return list;
	}
	@Override
	public List<Shop_style1> query2(int style1_id) {
		String sql="select * from shop_style1 where style1_id=?";
		List<Shop_style1>list=dao.query(sql, style1_id);
		return list;
	}

}
