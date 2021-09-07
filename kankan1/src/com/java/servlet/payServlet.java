package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Coupon;
import com.java.pojo.Redpacket;
import com.java.pojo.Shippingaddress;
import com.java.pojo.Shop;
import com.java.pojo.Shop_style1;
import com.java.pojo.Shop_style2;
import com.java.servise.couponServise;
import com.java.servise.redpacketServise;
import com.java.servise.shippingaddressServise;
import com.java.servise.shopServise;
import com.java.servise.shop_style1Servise;
import com.java.servise.shop_style2Servise;

public class payServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		// 接口对象
		shopServise shops=new shopServise();
		shippingaddressServise s = new shippingaddressServise();
		shop_style1Servise style1s=new shop_style1Servise();
		shop_style2Servise style2s=new shop_style2Servise();
		couponServise coupons=new couponServise();
		redpacketServise redpackets=new redpacketServise();

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			String msg = "请先登录在进行购买";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("pay.jsp").forward(request, response);
		}
		int user_ID = (int) session.getAttribute("id");

		//拿取商品id
		int shop_ID=0;
		if(request.getParameter("shop_ID")!=null) {
			shop_ID=Integer.valueOf(request.getParameter("shop_ID"));
			session.setAttribute("shop_ID", shop_ID);
		}
		int style1_id=0;
		if(request.getParameter("style1_id")!=null) {
			style1_id=Integer.valueOf(request.getParameter("style1_id"));
			session.setAttribute("style1_id", style1_id);
			
		}
		int style2_id=0;
		if(request.getParameter("style2_id")!=null) {
		style2_id=Integer.valueOf(request.getParameter("style2_id"));
		session.setAttribute("style2_id", style2_id);
		}
		
		// 操作处理
		if (request.getParameter("item") != null) {
			int item = Integer.valueOf(request.getParameter("item"));
			// item==1说明要执行删除操作
			if (item == 1) {
				int sa_id = Integer.valueOf(request.getParameter("sa_id"));
				s.del(sa_id);
			}
			// item==2说明要执行添加操作
			if (item == 2) {
				Shippingaddress sa = new Shippingaddress();
				String sa_name = request.getParameter("sa_name");
				String sa_tel = request.getParameter("sa_tel");
				int province = Integer.valueOf(request.getParameter("province"));
				int city = Integer.valueOf(request.getParameter("city"));
				int areas = Integer.valueOf(request.getParameter("areas"));
				String sa_text = request.getParameter("sa_text");
				sa.setUser_ID(user_ID);
				sa.setSa_name(sa_name);
				sa.setSa_tel(sa_tel);
				sa.setSa_text(sa_text);
				sa.setArea_id(areas);
				sa.setCity_id(city);
				sa.setProvince_id(province);
				s.insert(sa);

			}
			//提交订单开始购买
			if(item==4) {
				int sa_id=Integer.valueOf(request.getParameter("sa_id"));
				int shop_num=Integer.valueOf(request.getParameter("shop_num"));
				int sumprice=Integer.valueOf(request.getParameter("sumprice"));
				session.setAttribute("sa_id", sa_id);
				session.setAttribute("shop_num", shop_num);
				session.setAttribute("sumprice", sumprice);
				request.getRequestDispatcher("success.html").forward(request, response);
			}

		}
		
		//红包优惠卷
		String state="可使用";
		List<Coupon>listcoupon=coupons.query5(user_ID, shop_ID,state);
		List<Redpacket>listredpacket=redpackets.query1(state, user_ID);
		
		request.setAttribute("listcoupon", listcoupon);
		request.setAttribute("listredpacket", listredpacket);
		
		
		//获取商品样式
		List<Shop_style1>liststyle1=style1s.query2(style1_id);
		String style1_name=null;
		for(Shop_style1 style1:liststyle1) {
			style1_name=style1.getStyle1_text();
		}
		
		List<Shop_style2>liststyle2=style2s.query2(style2_id);
		String style2_name=null;
		for(Shop_style2 style2:liststyle2) {
			style2_name=style2.getStyle2_text();
		}
		request.setAttribute("style1_name", style1_name);
		request.setAttribute("style2_name", style2_name);

		//根据商品id拿到商品信息返回给商品信息界面
		List<Shop>listShop=shops.query3(shop_ID);
		request.setAttribute("listShop", listShop);

		// 查询收货地址
		List<Shippingaddress> list = s.query1(user_ID);
		request.setAttribute("list", list);

		request.getRequestDispatcher("pay.jsp").forward(request, response);

	}

}
