package com.java.servise;

import java.util.List;

import com.java.dao.shop_typeBaseDao;
import com.java.interfaces.shop_typeInterface;
import com.java.pojo.Shop_type;

public class shop_typeServise implements shop_typeInterface{
shop_typeBaseDao dao =new shop_typeBaseDao();
	//根据id查询商品类型
	public List<Shop_type> query1(int type_id) {
		String sql="select * from shop_type where type_id =?";
		List<Shop_type>list=dao.query(sql, type_id);
		return list;
	}

	//根据类型查询商品类型id
	public List<Shop_type> query2(String type) {
		String sql="select * from shop_type where type =?";
		List<Shop_type>list=dao.query(sql, type);
		return list;
	}
	
	

}
