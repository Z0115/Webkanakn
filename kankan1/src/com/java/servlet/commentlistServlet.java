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
import com.java.servise.commentServise;
import com.java.servise.informationServise;

public class commentlistServlet extends HttpServlet {

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
		commentServise comments=new commentServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在对商品进行评价！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("commentlist.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		int information_id=0;
		if(request.getAttribute("information_id")!=null) {
			information_id =(int)request.getAttribute("information_id");
		}
		int item=0;
		if(request.getParameter("item")!=null) {
			item = Integer.valueOf(request.getParameter("item"));
			//评论商品操作
			if(item==1) {
				String comment_text=request.getParameter("comment_text");
				int shop_ID=Integer.valueOf(request.getParameter("shop_ID"));
				comments.insert(shop_ID, user_ID, comment_text);
				String msg = "你已对商品进行评价！";
				request.setAttribute("msg",msg);
				information_id=Integer.valueOf(request.getParameter("information_id"));
				String state="已评价";
				informations.update(state, information_id);
			}
			
			
		}
		
		//接受点击订单详情传送过来的订单id
				
				List<Information>list=informations.query3(information_id);
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("commentlist.jsp").forward(request, response);
				
		
		
		
	}

}
