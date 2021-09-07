package com.java.interfaces;

import java.util.List;

import com.java.pojo.Coupon;

public interface couponInterface {
	//查询未过期和过期和使用过优惠券
	List<Coupon> query1(String coupon_state,int user_ID);

	//查询指定商品优惠卷
	List<Coupon> query3(int shop_id);
	
	//查询所有优惠卷
	List<Coupon> query4(int user_ID);
	
	//修改优惠卷状态
    boolean update(int coupon_id,String coupon_state,int user_ID);
    
    //删除已使用或过期优惠卷
    boolean del(int coupon_id);
    
    //领取优惠卷
    boolean insertlingqu(Coupon coupon,int user_ID);
    
    //查询指定商品自己拥有的优惠卷
	List<Coupon> query5(int user_ID,int shop_ID,String coupon_state);
    
    
}
