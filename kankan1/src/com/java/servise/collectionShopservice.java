package com.java.servise;

import java.util.List;

import com.java.dao.collectionShopBaseDao;
import com.java.interfaces.collectionShopInterface;
import com.java.pojo.CollectionShop;

public class collectionShopservice implements collectionShopInterface {
	collectionShopBaseDao dao =new collectionShopBaseDao();
	// 查看收藏商品
	public List<CollectionShop> query1(int user_ID) {
		String sql = "select * from collectionShop where user_ID=?";
		List<CollectionShop> list =dao.query(sql, user_ID);
		return list;
	}

}
