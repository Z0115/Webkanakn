package com.java.servise;

import java.util.List;

import com.java.dao.shippingaddressBaseDao;
import com.java.interfaces.shippingaddressInterface;
import com.java.pojo.Shippingaddress;

public class shippingaddressServise implements shippingaddressInterface{
	shippingaddressBaseDao dao =new shippingaddressBaseDao();
	//查询收货地址
	public List<Shippingaddress> query1(int user_ID) {
		String sql="select * from shippingaddress where user_ID=?";
		List<Shippingaddress>list=dao.query(sql, user_ID);
		return list;
	}

	//删除收货地址
	public boolean del(int sa_id) {
		String sql="delete from shippingaddress where sa_id=?";
		boolean b=dao.updateDeleteInsert(sql, sa_id);
		return b;
	}

	//增加收货地址
	public boolean insert(Shippingaddress shippingaddress) {
		String sql="insert into shippingaddress values(null,?,?,?,?,?,?,?)";
		boolean b=dao.updateDeleteInsert(sql, shippingaddress.getSa_name(),shippingaddress.getSa_tel(),shippingaddress.getProvince_id(),shippingaddress.getCity_id(),shippingaddress.getArea_id(),shippingaddress.getSa_text(),shippingaddress.getUser_ID());
		return b;
	}

	//根据地址id查询收货地址
	public List<Shippingaddress> query2(int sa_id) {
		String sql="select * from shippingaddress where sa_id=?";
		List<Shippingaddress>list=dao.query(sql, sa_id);
		return list;
	}

}
