package com.java.interfaces;

import java.util.List;

import com.java.pojo.Products;

public interface Productsinterface {
	//��ɾ�Ĳ�
	List<Products> getAllPro();
	
	void delPro(int id);
	
	void addPro(Products products);
	
	void updPro(Products products);
	
	
	
	
}
