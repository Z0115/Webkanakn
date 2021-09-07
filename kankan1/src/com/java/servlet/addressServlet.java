package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Shippingaddress;
import com.java.servise.shippingaddressServise;

public class addressServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		shippingaddressServise s=new shippingaddressServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看收货地址";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("address.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		//操作处理
		if(request.getParameter("item")!=null) {
			int item=Integer.valueOf(request.getParameter("item"));
			//item==1说明要执行删除操作
			if(item==1) {
				int sa_id=Integer.valueOf(request.getParameter("sa_id"));
				s.del(sa_id);
			}
			//item==2说明要执行添加操作
			if(item==2) {
				Shippingaddress sa=new Shippingaddress();
				String sa_name =request.getParameter("sa_name");
				String sa_tel =request.getParameter("sa_tel");
				int province=Integer.valueOf(request.getParameter("province"));
				int city=Integer.valueOf(request.getParameter("city"));
				int areas=Integer.valueOf(request.getParameter("areas"));
				String sa_text=request.getParameter("sa_text");
				sa.setUser_ID(user_ID);
				sa.setSa_name(sa_name);
				sa.setSa_tel(sa_tel);
				sa.setSa_text(sa_text);
				sa.setArea_id(areas);
				sa.setCity_id(city);
				sa.setProvince_id(province);
				s.insert(sa);
				
			}
			
			
		}
		
		
		
		
		
		//查询收货地址 
		List<Shippingaddress>list=s.query1(user_ID);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("address.jsp").forward(request, response);
	}

}
