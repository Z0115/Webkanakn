package com.java.servise;

import java.util.List;

import com.java.dao.collectionBaseDao;
import com.java.interfaces.collectionInterface;
import com.java.pojo.Collection;

public class collectionServise implements collectionInterface{
collectionBaseDao dao =new collectionBaseDao();
	//查看收藏商品
	public List<Collection> query1(int user_ID) {
		String sql="select * from collection where user_ID=?";
		List<Collection>list=dao.query(sql, user_ID);
		return list;
	}

	//添加收藏
	public boolean insertCollection(Collection collection) {
		String sql="insert into collection values(null,?,?)";
		boolean b=dao.updateDeleteInsert(sql, collection.getShop_ID(),collection.getUser_ID());
		return b;
	}
	
	@Override
	public boolean deleteCollection(int user_ID) {
		String sql="delete from collection where collection_id=?";
		boolean b=dao.updateDeleteInsert(sql, user_ID);
		return b;
	}

}
