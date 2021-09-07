package com.java.servise;

import java.util.List;

import com.java.dao.shop_adressBaseDao;
import com.java.interfaces.shop_adressInterface;
import com.java.pojo.Shop_adress;

public class shop_adressServise implements shop_adressInterface{
shop_adressBaseDao dao = new shop_adressBaseDao();
	//根据id查找商品地址
	public List<Shop_adress> query(int adress_id) {
		String sql="select * from shop_adress where adress_id=?";
		List<Shop_adress>list =dao.query(sql, adress_id);
		return list;
	}
	

}
