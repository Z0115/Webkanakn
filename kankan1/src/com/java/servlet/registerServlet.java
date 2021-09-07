package com.java.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.pojo.Customer;
import com.java.pojo.User;
import com.java.servise.UserServise;
import com.java.servise.customerServise;

public class registerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String username =request.getParameter("username");
		String userpwd =request.getParameter("userpwd");
		String pwdok=request.getParameter("pwdOk");
		if(username.trim().length()==0) {
			String msg = "账号不能为空！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
		if(userpwd.trim().length()==0) {
			String msg = "密码不能为空！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		if(pwdok.trim().length()==0) {
			String msg = "确认密码不能为空！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		if(!pwdok.equals(userpwd)) {
			String msg = "两次输入的密码不一样！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
		//调用方法
		UserServise s =new UserServise();
		//判断用户是否存在
		String pwd=null;
		List<User>list=s.queryLogin(username);
		if(list!=null) {
			for (User user:list) {
				if(user.getUserpwd().length()!=0)
				pwd =user.getUserpwd();
			}
			
		}
		if(pwd!=null) {
			String msg = "账号已存在，请重新创建！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else {
			s.insert(username, userpwd);
			String msg = "账号注册成功，请登录！";
			request.setAttribute("msg",msg);
			//为新用户创建客户基本信息
			List<User>list2=s.queryID(username);
			int id=0;
			if(list2!=null) {
				for (User user:list2) {
					id=user.getId();
				}
				
			}
			customerServise s2=new customerServise();
			Customer ct=new Customer();
			ct.setCustomer_img("http://localhost:8080/kankanjavaweb/images/getAvatar.do.jpg");
			ct.setCustomer_balance(0);
			ct.setUser_ID(id);
			String name="kankanuser";
			int j =0;
			for(int i=0;i<6;i++) {
				Random random = new Random();
				j=random.nextInt(10);
				name=name+j;
			}
			ct.setCustomer_nickname(name);
			boolean b=s2.insert(ct);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
		

	}

}
