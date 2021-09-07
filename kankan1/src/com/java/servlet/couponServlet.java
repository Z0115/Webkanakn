package com.java.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Coupon;
import com.java.servise.couponServise;

public class couponServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		couponServise s=new couponServise();
		
		//操作
		if(request.getParameter("item")!=null) {
			//删除优惠卷
			int item=Integer.valueOf(request.getParameter("item"));
			if(item==1) {
				int c_id=Integer.valueOf(request.getParameter("coupon_id"));
				s.del(c_id);
			}
		}
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看优惠卷";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("coupon.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		
		//判断优惠卷是否过期
		List<Coupon>list=s.query4(user_ID);
		String coupon_end_time=null;
		int coupon_id=0;
		String coupon_state="已过期";
	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	    Date date2=null;
	    Date date1=null;//当前日期
		for(Coupon coupon:list) {
			coupon_end_time =coupon.getCoupon_end_time();
			try {
				date1=df.parse(df.format(new Date()));
			    date2=df.parse(coupon_end_time);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//如果当前日期大于结束日期，则优惠卷过期
			if(date1.getTime()>date2.getTime()) {
				coupon_id=coupon.getCoupon_id();
				s.update(coupon_id, coupon_state,user_ID);
			}
			
		}
		
		//查询可使用优惠卷
		String coupon_state2="可使用";
		List<Coupon>list1=s.query1(coupon_state2,user_ID);
		request.setAttribute("list1", list1);
		
		//查询已使用优惠卷
		String coupon_state3="已使用";
		List<Coupon>list2=s.query1(coupon_state3,user_ID);
		request.setAttribute("list2", list2);
		
		//查询已过期优惠卷
		List<Coupon>list3=s.query1(coupon_state,user_ID);
		request.setAttribute("list3", list3);		
		
		request.getRequestDispatcher("coupon.jsp").forward(request, response);
	}

}
