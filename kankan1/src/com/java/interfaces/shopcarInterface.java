package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shopcar;

public interface shopcarInterface {

	//添加购物车
	boolean insert(Shopcar shopcar);
	//查询购物
	List<Shopcar> query(int user_ID);

}
