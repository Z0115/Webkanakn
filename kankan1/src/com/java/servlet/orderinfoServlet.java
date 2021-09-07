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

public class orderinfoServlet extends HttpServlet {

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
			request.getRequestDispatcher("orderinfo.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		
		
		//接受点击订单详情传送过来的订单id
		int information_id=(int)request.getAttribute("information_id");
		List<Information>list=informations.query3(information_id);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("orderinfo.jsp").forward(request, response);
		

	}

}
