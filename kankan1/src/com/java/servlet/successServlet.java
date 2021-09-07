package com.java.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Information;
import com.java.servise.informationServise;

public class successServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//实体类调用
		informationServise informations=new informationServise();
		
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			String msg = "请先登录在进行付款";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}
		int user_ID = (int) session.getAttribute("id");
		int shop_ID = (int) session.getAttribute("shop_ID");
		int style1_id = (int) session.getAttribute("style1_id");
		int style2_id = (int) session.getAttribute("style2_id");
		int sa_id = (int) session.getAttribute("sa_id");
		int shop_num = (int) session.getAttribute("shop_num");
		int sumprice = (int) session.getAttribute("sumprice");
		String state="待发货";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String information_time=df.format(new Date());
		
		Information information =new Information();
		information.setInformation_state(state);
		information.setSa_ID(sa_id);
		information.setShop_ID(shop_ID);
		information.setShop_num(shop_num);
		information.setStyle1_ID(style1_id);
		information.setStyle2_ID(style2_id);
		information.setUser_ID(user_ID);
		information.setInformation_time(information_time);
		System.out.println(information);
		
		//调用方法开始生成订单
		informations.insert(information);
		
		
		
		request.getRequestDispatcher("success.jsp").forward(request, response);
		
	}

}
