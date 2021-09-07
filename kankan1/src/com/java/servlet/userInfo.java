package com.java.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Collection;
import com.java.pojo.Coupon;
import com.java.pojo.Customer;
import com.java.pojo.Information;
import com.java.pojo.Redpacket;
import com.java.servise.collectionServise;
import com.java.servise.couponServise;
import com.java.servise.customerServise;
import com.java.servise.informationServise;
import com.java.servise.redpacketServise;

public class userInfo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//调用接口方法
		customerServise customers=new customerServise();
		couponServise coupons= new couponServise();
		redpacketServise redpackets=new redpacketServise();
		collectionServise collections=new collectionServise();
		informationServise informations=new informationServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看个人中心";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		//优惠卷的数量
		List<Coupon>listcoupon=coupons.query4(user_ID);
		int coupon_num=listcoupon.size();
		request.setAttribute("coupon_num", coupon_num);
		
		//红包数量
		List<Redpacket>listredpacket=redpackets.queryAll(user_ID);
		int redpacket_num=listredpacket.size();
		request.setAttribute("redpacket_num", redpacket_num);
		
		//客户信息
		List<Customer>listcustomer=customers.query2(user_ID);
		request.setAttribute("listcustomer", listcustomer);
		
		//待评价和待发货数量
		String state="待发货";
		String state2="待评价";
		String state3="待收货";
		List<Information>liststate1=informations.query(state, user_ID);
		List<Information>liststate2=informations.query(state2, user_ID);
		List<Information>liststate3=informations.query(state3, user_ID);
        int information1=liststate1.size();
        int information2=liststate2.size();
        int information3=liststate3.size();
		request.setAttribute("information1", information1);
		request.setAttribute("information2", information2);
		request.setAttribute("information3", information3);
		
		//收藏的商品
		List<Collection>listcollection=collections.query1(user_ID);
		request.setAttribute("listcollection", listcollection);
		
		//获取当前日期
		SimpleDateFormat dateFm = new SimpleDateFormat("EEEE");
		SimpleDateFormat dateFm2 = new SimpleDateFormat("YYYY");
		Date da=new Date();
		int days=da.getDate();
		String years=dateFm2.format(da);
		int mons=da.getMonth()+1;
		String weekday= dateFm.format(da);
		request.setAttribute("days", days);
		request.setAttribute("years", years);
		request.setAttribute("mons", mons);
		request.setAttribute("weekday", weekday);
		System.out.println(years);
		
		
		request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		
	}

}
