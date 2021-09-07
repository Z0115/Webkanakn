package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.User;
import com.java.servise.UserServise;

public class loginServlet extends HttpServlet {

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
		if(username.trim().length()==0) {
			String msg = "账号不能为空！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(userpwd.trim().length()==0) {
			String msg = "密码不能为空！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		UserServise s =new UserServise();
		String pwd=null;
	    int id =0;
		List<User>list=s.queryLogin(username);
		if(list!=null) {
			for (User user:list) {
				pwd =user.getUserpwd();
				id=user.getId();
			}
			
		}
		//为找到登录密码
		if(pwd==null) {
			String msg = "账号信息不存在！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(pwd.equals(userpwd)) {
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			response.sendRedirect("index.html");
		}else {
			String msg = "账号或密码不正确";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
