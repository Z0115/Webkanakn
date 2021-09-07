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
import com.java.pojo.Shop;
import com.java.servise.informationServise;
import com.java.servise.shopServise;

public class billServlet extends HttpServlet {

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
		shopServise shops= new shopServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看账单明细";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("bill.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		List<Information>listinformation=informations.query2(user_ID);
		List<Shop>listshop=null;
		request.setAttribute("listinformation", listinformation);
		int shop_ID=0;
		int xprice=0;
		for(Information information:listinformation) {
			shop_ID=information.getShop_ID();
			listshop=shops.query4(shop_ID);
			for(Shop shop:listshop) {
				xprice+=shop.getShop_price()*information.getShop_num()+10;
			}
			
		}
		
		request.setAttribute("xprice", xprice);
		
		
		
		request.getRequestDispatcher("bill.jsp").forward(request, response);

	}

}
