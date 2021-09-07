package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Collection;
import com.java.pojo.CollectionShop;
import com.java.servise.collectionServise;
import com.java.servise.collectionShopservice;

public class collectionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录再进行实名认证";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("idcard.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		collectionShopservice c=new collectionShopservice();
		collectionServise s=new collectionServise();
		//操作处理
		if(request.getParameter("item")!=null) {
			int item=Integer.valueOf(request.getParameter("item"));
			//item==1说明要执行删除操作
			if(item==1) {
				int sid=Integer.valueOf(request.getParameter("sid"));
				s.deleteCollection(sid);
			}
		}
		List<CollectionShop> list=c.query1(user_ID);
		request.setAttribute("list", list);
		
		
		
		
		
		request.getRequestDispatcher("collection.jsp").forward(request, response);
	}

}
