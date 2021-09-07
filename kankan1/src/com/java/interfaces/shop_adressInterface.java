package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shop_adress;

public interface shop_adressInterface {
	

	//根据id查找商品地址ַ
	List<Shop_adress> query(int adress_id);

}
