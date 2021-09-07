package com.java.servise;

import java.util.List;

import com.java.dao.customerBaseDao;
import com.java.interfaces.customerinterface;
import com.java.pojo.Customer;

public class customerServise implements customerinterface {
	customerBaseDao dao = new customerBaseDao();

	// 查询所有
	public List<Customer> query() {
		String sql = "select * from customer";
		List<Customer> list = dao.query(sql);
		return list;
	}

	// 查询单个用户信息
	public List<Customer> query2(int id) {
		String sql = "select * from customer where user_ID=?";
		List<Customer> list = dao.query(sql,id);
		return list;
	}

    //添加用户信息
	public boolean insert(Customer customer) {
		String sql ="insert into customer values(null,null,?,null,null,null,?,?,?)";
		boolean b=dao.updateDeleteInsert(sql, customer.getCustomer_nickname(),customer.getCustomer_img(),customer.getCustomer_balance(),customer.getUser_ID());
		return false;
	}

	//修改用户信息
	public boolean update(Customer customer) {
		String sql = "update customer set customer_name=?,customer_nickname=?,customer_sex=?,customer_borthday=?,customer_tel=?,customer_emil=? where user_ID=?";
		boolean b=dao.updateDeleteInsert(sql, customer.getCustomer_name(),customer.getCustomer_nickname(),customer.getCustomer_sex(),customer.getCustomer_borthday(),customer.getCustomer_tel(),customer.getCustomer_emil(),customer.getUser_ID());
		return b;
	}

	//修改客户头像
	public boolean updateImg(String img, int user_ID) {
		String sql="update customer set customer_img=? where user_ID=?";
		boolean b=dao.updateDeleteInsert(sql,img,user_ID);
		return b;
	}
	
	@Override
	public boolean updates(Customer customer) {
		String sql = "update customer set customer_nickname=?,customer_sfz=? where user_ID=?";
		boolean b=dao.updateDeleteInsert(sql, customer.getCustomer_nickname(),customer.getCustomer_sfz(),customer.getUser_ID());
		return b;
	}

}
