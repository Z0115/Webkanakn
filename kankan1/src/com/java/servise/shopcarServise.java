package com.java.servise;

import java.util.List;

import com.java.dao.shopcarBaseDao;
import com.java.interfaces.shopcarInterface;
import com.java.pojo.Shopcar;

public class shopcarServise implements shopcarInterface{
shopcarBaseDao dao =new shopcarBaseDao();
	//添加购物车
	public boolean insert(Shopcar shopcar) {
		String sql="insert into shopcar values(null,?,?,?,?)";
		boolean b=dao.updateDeleteInsert(sql, shopcar.getShop_ID(),shopcar.getStyle1_ID(),shopcar.getStyle2_ID(),shopcar.getUser_ID());
		return b;
	}

	//查询购物车
	public List<Shopcar> query(int user_ID) {
		String sql ="select * from shopcar where user_ID=?";
		List<Shopcar>list=dao.query(sql, user_ID);
		return list;
	}

}
