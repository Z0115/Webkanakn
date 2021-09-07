package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shop;

public interface shopInterface {

	//查询所有商品
	List<Shop> query1();
	//根据类型查询商品
	List<Shop> query2(int type_ID);
    //根据id查询商品
	List<Shop> query3(int shop_ID);
	//根据商品id查询商品
	List<Shop> query4(int shop_id);
	List<Shop> query5(String name);

}
