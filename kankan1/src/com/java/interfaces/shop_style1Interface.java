package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shop_style1;

public interface shop_style1Interface {
	//根据商品id查询样式
	List<Shop_style1> query1(int shop_ID);
	
	//根据样式id查询样式
	List<Shop_style1> query2(int style1_id);
}
