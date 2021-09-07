package com.java.servise;

import java.util.List;

import com.java.dao.couponBaseDao;
import com.java.interfaces.couponInterface;
import com.java.pojo.Coupon;

public class couponServise implements couponInterface {

	couponBaseDao dao = new couponBaseDao();

	// 查询未过期和过期和使用过的优惠券
	public List<Coupon> query1(String coupon_state, int user_ID) {
		String sql = "select * from coupon where coupon_state =? and user_ID=?";
		List<Coupon> list = dao.query(sql, coupon_state, user_ID);
		return list;
	}

	// 查询指定商品优惠卷
	public List<Coupon> query3(int shop_id) {
		String sql = "select * from coupon where shop_ID =?";
		List<Coupon> list = dao.query(sql, shop_id);
		return list;
	}

	// 查询所有优惠卷
	public List<Coupon> query4(int user_ID) {
		String sql = "select * from coupon where user_ID=?";
		List<Coupon> list = dao.query(sql, user_ID);
		return list;
	}

	// 修改优惠卷状态
	public boolean update(int coupon_id, String coupon_state, int user_ID) {
		String sql = "update coupon set coupon_state=? where coupon_id=? and coupon_state !=? and user_ID=?";
		String state = "已使用";
		boolean b = dao.updateDeleteInsert(sql, coupon_state, coupon_id, state, user_ID);
		return b;
	}

	// 删除已使用或过期优惠卷
	public boolean del(int coupon_id) {
		String sql = "delete from coupon where coupon_id=?";
		boolean b = dao.updateDeleteInsert(sql, coupon_id);
		return b;
	}

	//领取优惠卷
	public boolean insertlingqu(Coupon coupon, int user_ID) {
		String sql="insert into coupon values(null,?,?,?,?,?,?,?)";
		boolean b=dao.updateDeleteInsert(sql, coupon.getCoupon_price(),coupon.getCoupon_text(),coupon.getCoupon_begin_time(),coupon.getCoupon_end_time(),coupon.getCoupon_state(),coupon.getShop_ID(),user_ID);
		return b;
	}

	@Override
	public List<Coupon> query5(int user_ID, int shop_ID,String coupon_state) {
		String sql = "select * from coupon where user_ID=?and shop_ID=? and coupon_state=?";
		List<Coupon> list = dao.query(sql, user_ID,shop_ID,coupon_state);
		return list;
	}



}
