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
import com.java.servise.informationServise;

public class billlistServlet extends HttpServlet {

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
			informationServise informations= new informationServise();
			
			HttpSession session=request.getSession();
			if(session.getAttribute("id")==null) {
				String msg = "请先登录在查看账单详情!";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("billlist.jsp").forward(request, response);
			}
			int user_ID=(int) session.getAttribute("id");
		
			int item=0;
			if(request.getParameter("item")!=null) {
				item = Integer.valueOf(request.getParameter("item"));
				//删除账单信息
				if(item==1) {
					String state="待评价";
					String state2="已评价";
					int information_id=Integer.valueOf(request.getParameter("information_id"));
					boolean b=informations.del(information_id,state,state2);
					if(b==false) {
						String msg = "对不起，你暂时不能删除此信息!";
						request.setAttribute("msg",msg);
					}
				}
				
				
			}

			//拿到客户所有订单信息
			List<Information>list = informations.query2(user_ID);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("billlist.jsp").forward(request, response);
			
	}

}
