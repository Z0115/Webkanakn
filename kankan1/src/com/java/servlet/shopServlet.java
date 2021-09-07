package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Collection;
import com.java.pojo.Comment;
import com.java.pojo.Coupon;
import com.java.pojo.Shop;
import com.java.pojo.Shop_style1;
import com.java.pojo.Shop_style2;
import com.java.pojo.Shopcar;
import com.java.servise.collectionServise;
import com.java.servise.commentServise;
import com.java.servise.couponServise;
import com.java.servise.shopServise;
import com.java.servise.shop_style1Servise;
import com.java.servise.shop_style2Servise;
import com.java.servise.shopcarServise;

public class shopServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//调用接口
		shopServise shops=new shopServise();
		shop_style1Servise style1s=new shop_style1Servise();
		shop_style2Servise style2s=new shop_style2Servise();
		commentServise comments=new commentServise();
		couponServise coupons=new couponServise();
		collectionServise collections= new collectionServise();
		shopcarServise shopcars= new shopcarServise();
		
		//接受登录信息
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看商品信息";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("shop.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		//拿取商品id
		int shop_ID=0;
		if(request.getParameter("shop_ID")!=null) {
			shop_ID=Integer.valueOf(request.getParameter("shop_ID"));
		}
		
		//操作
		int item=0;
		if(request.getParameter("item")!=null) {
			//获取操作等级
			item=Integer.valueOf(request.getParameter("item"));
			
			//领取优惠卷信息
			if(item==1) {
                Coupon coupon = new Coupon();
				List<Coupon>couponList=coupons.query3(shop_ID);
				for(Coupon c:couponList) {
					coupon.setCoupon_price(c.getCoupon_price());
					coupon.setCoupon_text(c.getCoupon_text());
					coupon.setCoupon_begin_time(c.getCoupon_begin_time());
					coupon.setCoupon_end_time(c.getCoupon_end_time());
					coupon.setCoupon_state(c.getCoupon_state());
					coupon.setShop_ID(c.getShop_ID());
				}
				coupons.insertlingqu(coupon, user_ID);
				String msg = "优惠卷领取成功";
				request.setAttribute("msg",msg);
			}
			
			//添加收藏
			if(item==2) {
				Collection collection =new Collection();
				collection.setShop_ID(shop_ID);
				collection.setUser_ID(user_ID);
				collections.insertCollection(collection);
				String msg = "商品已添加收藏";
				request.setAttribute("msg",msg);
			}
			
			//加入购物车
			if(item==3) {
				int style1_id=Integer.valueOf(request.getParameter("style1_id"));
				int style2_id=Integer.valueOf(request.getParameter("style2_id"));
				Shopcar shopcar = new Shopcar();
				shopcar.setShop_ID(shop_ID);
				shopcar.setStyle1_ID(style1_id);
				shopcar.setStyle2_ID(style2_id);
				shopcar.setUser_ID(user_ID);
				shopcars.insert(shopcar);
				String msg = "商品已加入购物车";
				request.setAttribute("msg",msg);
			}
			
			
			
			
		}
		
		
		
		
		//根据商品id拿到商品信息返回给商品信息界面
		List<Shop>listShop=shops.query3(shop_ID);
		request.setAttribute("listShop", listShop);
		
		//获取商品id查询商品样式
		int shop_id=0;
		int type_ID=0;
		for(Shop shop:listShop) {
			shop_id=shop.getShop_id();
			type_ID=shop.getType_ID();
		}
		//获取同类型商品
		List<Shop>listtype=shops.query2(type_ID);
		request.setAttribute("listtype",listtype);
		
		//根据商品id获取优惠卷
		List<Coupon>couponList=coupons.query3(shop_ID);
		request.setAttribute("couponList", couponList);
		//获取商品评论数量
		List<Comment>commentList=comments.query1(shop_id);
		int comment=commentList.size();
		request.setAttribute("commentList", commentList);
		
		
		List<Shop_style1>style1List=style1s.query1(shop_id);
		List<Shop_style2>style2List=style2s.query(shop_id);
		request.setAttribute("style1List", style1List);
		request.setAttribute("style2List", style2List);
		request.setAttribute("comment", comment);
		request.getRequestDispatcher("shop.jsp").forward(request, response);
		
		
	
	}

}
