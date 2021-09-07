package com.java.servise;

import java.util.List;

import com.java.dao.shop_style2BaseDao;
import com.java.interfaces.shop_style2Interface;
import com.java.pojo.Shop_style2;

public class shop_style2Servise implements shop_style2Interface{
shop_style2BaseDao dao = new shop_style2BaseDao();
	//根据商品id查看样式
	public List<Shop_style2> query(int shop_ID) {
		String sql="select * from shop_style2 where shop_ID =?";
		List<Shop_style2>list=dao.query(sql, shop_ID);
		return list;
	}
	@Override
	public List<Shop_style2> query2(int style2_id) {
		String sql="select * from shop_style2 where style2_id =?";
		List<Shop_style2>list=dao.query(sql, style2_id);
		return list;
	}

}
