package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.interfaces.Productsinterface;
import com.java.pojo.Products;

public class ProductsBaseDao implements Productsinterface  {

	static Connection conn = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	
	
	

	public List<Products> getAllPro() {
		List<Products> list = new ArrayList<Products>();
		String sql = "select * from Products_List ";
		//获得数据库连接
		conn = DBConnection.getConnection();
		try {
			//预编译sql语句，防止注入攻击
			ps = conn.prepareStatement(sql);
			//执行数据库查询,得到结果集
			rs = ps.executeQuery();
			//循环遍历结果集
			while(rs.next()) {
				int shoppingid = rs.getInt("shoppingid");
				String shoppingname = rs.getString("shoppingname");
				double costprice = rs.getDouble("costprice");
				double rulingprice = rs.getDouble("rulingprice");
				String adress = rs.getString("adress");
				String addtime = rs.getString("addtime");
				String shentai = rs.getString("shentai");
				String zhuangtai = rs.getString("zhuangtai");
				Products products = new Products(shoppingid, shoppingname, costprice, rulingprice, adress,addtime,shentai,zhuangtai);
				list.add(products);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public void delPro(int id) {
		String sql = "delete from Products_List where id=?";
		conn = DBConnection.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			//设置参数
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addPro(Products products) {
		String sql = "insert into Products_List(shoppingname, costprice, rulingprice, adress,addtime,shentai,zhuangtai)values(?,?,?,?,?,?,?)";
		conn = DBConnection.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			//设置参数
			ps.setInt(1, products.getShoppingid());
			ps.setString(2, products.getShoppingname());
			ps.setDouble(3, products.getCostprice());
			ps.setDouble(4, products.getRulingprice());
			ps.setString(5, products.getAdress());
			ps.setString(6, products.getAddtime());
			ps.setString(7, products.getShentai());
			ps.setString(8, products.getZhuangtai());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updPro(Products products) {
		String sql = "update Products_List set shoppingname=?, costprice=?, rulingprice=?, adress=?,addtime=?,shentai=?,zhuangtai=? where shoppingid=?";
		try {
			ps = conn.prepareStatement(sql);
			//设置参数
			ps.setString(1, products.getShoppingname());
			ps.setDouble(2, products.getCostprice());
			ps.setDouble(3, products.getRulingprice());
			ps.setString(4, products.getAdress());
			ps.setString(5, products.getAddtime());
			ps.setString(6, products.getShentai());
			ps.setString(7, products.getZhuangtai());
			ps.setInt(8, products.getShoppingid());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
