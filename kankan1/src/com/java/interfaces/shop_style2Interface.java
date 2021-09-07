package com.java.interfaces;

import java.util.List;

import com.java.pojo.Shop_style2;

public interface shop_style2Interface {
	//根据商品id查询商品样式
	List<Shop_style2> query(int shop_ID);
	//根据样式id查询样式
	List<Shop_style2> query2(int style2_id);
}
