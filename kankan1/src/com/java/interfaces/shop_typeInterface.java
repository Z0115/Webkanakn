package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shop_type;

public interface shop_typeInterface {

	//根据id查询商品类型
	List<Shop_type> query1(int type_id);
	//根据类型查询商品类型id
	List<Shop_type> query2(String type);
}
