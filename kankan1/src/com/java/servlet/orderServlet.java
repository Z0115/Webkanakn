package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Information;
import com.java.servise.couponServise;
import com.java.servise.informationServise;

public class orderServlet extends HttpServlet {

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
		informationServise informations=new informationServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看订单信息";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("order.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		int item=0;
		if(request.getParameter("item")!=null) {
			item = Integer.valueOf(request.getParameter("item"));
			
			//确认收货
			if(item==1) {
				String state="待评价";
				int information_id=Integer.valueOf(request.getParameter("information_id"));
				informations.update(state, information_id);
				String msg = "商品收货成功！";
				request.setAttribute("msg",msg);
				
			}
			
			//订单详情
			if(item==2) {
				int information_id=Integer.valueOf(request.getParameter("information_id"));
				request.setAttribute("information_id", information_id);
				request.getRequestDispatcher("orderinfo.html").forward(request, response);
			}
			
			//商品评价
			if(item==3) {
				int information_id=Integer.valueOf(request.getParameter("information_id"));
				request.setAttribute("information_id", information_id);
				request.getRequestDispatcher("commentlist.html").forward(request, response);
			}
			
			
		}
		
		
		
		
		
		String state1="待发货";
		String state2="待收货";
		String state3="待评价";
		
		List<Information>list1=informations.query2(user_ID);
		List<Information>list2=informations.query(state1, user_ID);
		List<Information>list3=informations.query(state2, user_ID);
		List<Information>list4=informations.query(state3, user_ID);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		
		
		request.getRequestDispatcher("order.jsp").forward(request, response);
		
	}

}
