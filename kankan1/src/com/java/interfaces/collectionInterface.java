package com.java.interfaces;

import java.util.List;

import com.java.pojo.Collection;

public interface collectionInterface {
	
	//查询收藏
		List<Collection> query1(int user_ID);
		//添加收藏
		boolean insertCollection(Collection collection);

		boolean deleteCollection(int user_ID);
}
