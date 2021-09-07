package com.java.servise;

import java.util.List;

import com.java.dao.shopBaseDao;
import com.java.interfaces.shopInterface;
import com.java.pojo.Shop;

public class shopServise implements shopInterface{
shopBaseDao dao =new shopBaseDao();
	
	public List<Shop> query1() {
		String sql="select * from shop";
		List<Shop>list=dao.query(sql);
		return list;
	}

	
	public List<Shop> query2(int type_ID) {
		String sql="select * from shop where type_ID =?";
		List<Shop>list=dao.query(sql,type_ID);
		return list;
	}

	 //�������ֲ�ѯ��Ʒ
	public List<Shop> query3(int shop_ID) {
		String sql="select * from shop where shop_ID=?";
		List<Shop>list=dao.query(sql,shop_ID);
		return list;
	}

	
	public List<Shop> query4(int shop_id) {
		String sql="select * from shop where shop_id =?";
		List<Shop>list=dao.query(sql,shop_id);
		return list;
	}
	
		@Override
		public List<Shop> query5(String name) {
			String sql="select * from shop where shop_name like ?";
			List<Shop> list=dao.query(sql,"%"+name+"%");
			return list;
		}

}
