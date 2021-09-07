package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shippingaddress;

public interface shippingaddressInterface {
	
	//查询收货地址
	List<Shippingaddress> query1(int user_ID);
	
	//删除收货地址
	boolean del(int sa_id);
	//增加收货地址
	boolean insert(Shippingaddress shippingaddress);

	//根据id查询收货地址
	List<Shippingaddress> query2(int sa_id);
}
